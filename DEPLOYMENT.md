# Benpo Trouble - Heroku Deployment Guide

## Prerequisites
- Heroku CLI installed
- Git repository
- Heroku account

## Files Added for Deployment
- `Procfile` - Tells Heroku how to run the app
- `package.json` - Node.js dependencies for the web server
- `server.js` - Express server to serve Flutter web build
- `build.sh` - Build script (optional)

## Deployment Steps

### 1. Create Heroku App
```bash
heroku create benpo-trouble
# or use your preferred app name:
# heroku create your-app-name
```

### 2. Add Buildpacks
```bash
# Add Flutter buildpack first
heroku buildpacks:add https://github.com/dzenanr/heroku-buildpack-flutter.git

# Add Node.js buildpack for serving
heroku buildpacks:add heroku/nodejs
```

### 3. Set Environment Variables (Optional)
```bash
heroku config:set FLUTTER_WEB=true
```

### 4. Deploy
```bash
# Add all files to git
git add .
git commit -m "Add Heroku deployment files"

# Push to Heroku
git push heroku main
```

### 5. Open Your App
```bash
heroku open
```

## Alternative: Manual Build and Deploy

If the Flutter buildpack doesn't work, you can build locally and deploy:

```bash
# Build locally
flutter build web --release

# Make sure build/web is not in .gitignore
git add build/web
git commit -m "Add web build for deployment"

# Deploy
git push heroku main
```

## Troubleshooting

### Common Issues:
1. **Build fails**: Make sure all dependencies are in pubspec.yaml
2. **Server doesn't start**: Check that `server.js` exists and `package.json` has correct scripts
3. **Assets not loading**: Ensure `build/web` directory is included in deployment

### Logs:
```bash
heroku logs --tail
```

### Restart App:
```bash
heroku restart
```

## Local Testing
Before deploying, test locally:
```bash
npm install
flutter build web
npm start
```

Then visit `http://localhost:5000` 