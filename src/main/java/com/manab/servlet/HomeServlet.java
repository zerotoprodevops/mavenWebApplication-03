package com.manab.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = {"", "/", "/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Company Details
        request.setAttribute("companyName",   "Manab Technologies Ltd");
        request.setAttribute("tagline",       "Live DevOps Training Center");
        request.setAttribute("established",   "2020");
        request.setAttribute("location",      "India");
        request.setAttribute("website",       "www.manabtechnologies.com");
        request.setAttribute("email",         "info@manabtechnologies.com");
        request.setAttribute("phone",         "+91-XXXX-XXXXXX");

        // Courses
        List<String> courses = Arrays.asList(
            "DevOps Engineering (CI/CD, Jenkins, GitHub Actions)",
            "Docker & Kubernetes (Container Orchestration)",
            "AWS / Azure / GCP Cloud Training",
            "Linux Administration & Shell Scripting",
            "Terraform & Infrastructure as Code (IaC)",
            "Ansible Configuration Management",
            "Monitoring with Prometheus & Grafana",
            "Git & Version Control Workflows"
        );
        request.setAttribute("courses", courses);

        // Key Features
        List<String> features = Arrays.asList(
            "LIVE Instructor-Led Online Sessions",
            "Hands-on Lab Environments",
            "Real-World Project Experience",
            "Interview Preparation & Placement Support",
            "Recorded Session Access",
            "Industry-Certified Trainers"
        );
        request.setAttribute("features", features);

        request.getRequestDispatcher("/WEB-INF/views/home.jsp")
               .forward(request, response);
    }
}
