const jwt = require('jsonwebtoken');

module.exports = (allowedRoles) => {
  return (req, res, next) => {
    const authHeader = req.headers.authorization;
    if (!authHeader) {
      return res.status(401).json({ error: 'Unauthorized: Missing token' });
    }

    const token = authHeader.split(' ')[1];
    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      req.user = decoded;

      if (allowedRoles) {
        if (Array.isArray(allowedRoles)) {
          if (!allowedRoles.includes(req.user.role)) {
            console.log('🚫 Access denied. Role =', req.user.role, 'Allowed =', allowedRoles);
            return res.status(403).json({ error: 'Forbidden: insufficient role' });
          }
        } else {
          if (req.user.role !== allowedRoles) {
            console.log('🚫 Access denied. Role =', req.user.role, 'Allowed =', allowedRoles);
            return res.status(403).json({ error: 'Forbidden: insufficient role' });
          }
        }
      }

      next();
    } catch (err) {
      console.error('Auth error:', err);
      return res.status(403).json({ error: 'Invalid or expired token' });
    }
  };
};
