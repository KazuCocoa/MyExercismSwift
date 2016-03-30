import Darwin

struct SpaceAge {
    let age: Float
    init(_ number: Float) { age = number }

    var seconds: Float { return age }
    var onMercury: Float { return convert(age, to: 0.2408467) }
    var onVenus: Float { return convert(age, to: 0.61519726) }
    var onEarth: Float { return convert(age, to: 1.0) }
    var onMars: Float { return convert(age, to: 1.8808158) }
    var onJupiter: Float { return convert(age, to: 11.862615) }
    var onSaturn: Float { return convert(age, to: 29.447498) }
    var onUranus: Float { return convert(age, to: 84.016846) }
    var onNeptune: Float { return convert(age, to: 164.79132) }

    private func convert(seconds: Float, to spageAge: Float) -> Float {
        return round((seconds / (spageAge * 31557600.00)) * 100) / 100
    }
}
