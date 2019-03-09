function [particles] = particle_resampler(particles, nbr_of_particles, keep_probability, mu, sigma, nbr_of_states)

    for state = 1:nbr_of_states

        % sort weights
        particles(state, :, 2) = sort(particles(state, :, 2));

        % sort particles by weights
        particles(state, :, 1) = sort_a_like_b(sorted_weights, particles(state, :, 1));

        % find the max index up to which the particles will be kept
        max_keep_index = round(keep_probability*nbr_of_particles);

        % keep a certain portion of the particle
        kept_particles = particles(state, 1:max_keep_index, 2);
        kept_weights = particles(state, 1:max_keep_index, 1);

        % duplicate particles with kernel trick
        nbr_new_particles = nbr_of_particles - max_keep_index;
        for new_particle_index = 1:nbr_new_particles
            particle_to_duplicate = round(nbr_new_particles*rand());
            kernel_trick = normrnd(mu,sigma);
            particles(state, 1:max_keep_index+new_particle_index, 2) = particles(state, particle_to_duplicate, 2) + kernel_trick;
            particles(state, 1:max_keep_index+new_particle_index, 1) = particles(state, particle_to_duplicate, 1) + kernel_trick;
        end

    end
    
end

