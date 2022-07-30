import passport from 'passport';
import db from './models'

const GoogleStrategy = require('passport-google-oauth20').Strategy;
require('dotenv').config()

passport.use(new GoogleStrategy({
    clientID: process.env.GOOGLE_CLIENT_ID,
    clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    callbackURL: "/api/v1/auth/google/callback"
},
    async function (accessToken, refreshToken, profile, done) {
        if (profile?.id) {
            await db.User.findOrCreate({
                where: { id: profile.id },
                defaults: {
                    id: profile.id,
                    email: profile.emails[0]?.value || null,
                    username: profile.displayName || null,
                    typeLogin: 'google',
                    roleId: 1
                }
            })
        }
        done(null, profile)
    }
));


passport.serializeUser((user, done) => {
    done(null, user)
})
passport.deserializeUser((user, done) => {
    done(null, user)
})