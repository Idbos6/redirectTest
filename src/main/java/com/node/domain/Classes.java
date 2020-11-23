package com.node.domain;

public class Classes {

    private String id;
    private String specialty;
    private String cla;

    @Override
    public String toString() {
        return "Classes{" +
                "id='" + id + '\'' +
                ", specialty='" + specialty + '\'' +
                ", cla='" + cla + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getCla() {
        return cla;
    }

    public void setCla(String cla) {
        this.cla = cla;
    }
}
