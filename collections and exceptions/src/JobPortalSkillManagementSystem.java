import java.util.*;

public class JobPortalSkillManagementSystem {
    public static void main(String[] args) {

        List<String> inputSkills = Arrays.asList(
                "Java", "SQL", "Spring Boot", "Java", "React", "Docker", "SQL", "AWS"
        );

        Set<String> hashSkills = new HashSet<>(inputSkills);
        System.out.println("===== HASHSET =====");
        System.out.println("Skills: " + hashSkills);
        System.out.println("Contains React? " + hashSkills.contains("React"));
        hashSkills.remove("Docker");
        System.out.println("After removing Docker: " + hashSkills);
        System.out.println("Number of skills: " + hashSkills.size());

        Set<String> linkedSkills = new LinkedHashSet<>(inputSkills);
        System.out.println("\n===== LINKEDHASHSET =====");
        System.out.println("Skills: " + linkedSkills);
        System.out.println("Contains React? " + linkedSkills.contains("React"));
        linkedSkills.remove("Docker");
        System.out.println("After removing Docker: " + linkedSkills);
        System.out.println("Number of skills: " + linkedSkills.size());

        Set<String> treeSkills = new TreeSet<>(inputSkills);
        System.out.println("\n===== TREESET =====");
        System.out.println("Skills: " + treeSkills);
        System.out.println("Contains React? " + treeSkills.contains("React"));
        treeSkills.remove("Docker");
        System.out.println("After removing Docker: " + treeSkills);
        System.out.println("Number of skills: " + treeSkills.size());

        System.out.println("\n===== COMPARISON =====");
        System.out.println("HashSet      : " + hashSkills);
        System.out.println("LinkedHashSet: " + linkedSkills);
        System.out.println("TreeSet      : " + treeSkills);

        Set<String> extraSkills = new HashSet<>(Arrays.asList("Python", "AWS", "Kubernetes", "React"));
        linkedSkills.addAll(extraSkills);
        System.out.println("\nAfter addAll() in LinkedHashSet: " + linkedSkills);

        Set<String> commonSkills = new HashSet<>(hashSkills);
        commonSkills.retainAll(extraSkills);
        System.out.println("Common skills using retainAll(): " + commonSkills);

        hashSkills.clear();
        linkedSkills.clear();
        treeSkills.clear();

        System.out.println("\nAfter clear():");
        System.out.println("HashSet      : " + hashSkills);
        System.out.println("LinkedHashSet: " + linkedSkills);
        System.out.println("TreeSet      : " + treeSkills);
    }
}