package model;
public class WorkoutPlan {
    protected String level, description;
    public WorkoutPlan(String level, String description) {
        this.level = level; this.description = description;
    }
    public String getLevel() { return level; }
    public String getDescription() { return description; }
}
