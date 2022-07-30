export const isLoggedIn = async (req, res, next) => {
    try {
        req.user ? next() : res.status(401).json({ isSuccess: false, msg: 'Cần phải đăng nhập !' })
    }
    catch (err) {
        console.log(err)
    }
}