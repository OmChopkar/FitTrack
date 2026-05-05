package util;
public class BMIUtil {
    public static double calculateBMI(double weightKg, double heightCm) {
        double h = heightCm / 100.0;
        return weightKg / (h * h);
    }
    public static String getCategory(double bmi) {
        if(bmi<18.5) return "Underweight";
        else if(bmi<25) return "Normal";
        else if(bmi<30) return "Overweight";
        return "Obese";
    }
}
