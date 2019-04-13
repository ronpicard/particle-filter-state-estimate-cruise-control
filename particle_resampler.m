function [particles] = particle_resampler(particles, nbr_of_particles, keep_probability, sigma, nbr_of_states)

    for state = 1:nbr_of_states

        % sort weights in descending order
        %particles(state, :, 2) = sort(particles(state, :, 2),'ascend');

        % sort particles by weights
        [particles(state, :, 2), particles(state, :, 1)] = sort_b_like_a(particles(state, :, 2), particles(state, :, 1));

        % find the max index up to which the particles will be kept
        max_keep_index = round(keep_probability*nbr_of_particles);

        % keep a certain portion of the particle
        %kept_particles = particles(state, 1:max_keep_index, 2);
        %kept_weights = particles(state, 1:max_keep_index, 1);

        % duplicate particles with kernel trick
        for new_particle_index = 1:(nbr_of_particles-max_keep_index)
            % choose a random index from kept particles
            index_of_particle_to_duplicate = ceil(rand()*max_keep_index);
            % get particle value and weight
            mu = particles(state, index_of_particle_to_duplicate, 1);
            weight = particles(state, index_of_particle_to_duplicate, 2);
            % duplicate based off gaussian value around the particle
            kernel_trick = normrnd(mu,sigma);
            % store new particle & dupilcat e weight
            particles(state, (max_keep_index+new_particle_index), 1) = kernel_trick;
            particles(state, (max_keep_index+new_particle_index), 2) = weight;
        end

       % normalize the particles so that all the weights add up to one
       normalization_factor = sum(particles(state, :, 2));
       for index = 1:nbr_of_particles
            particles(state, index, 2) = particles(state, index, 2)/normalization_factor;
       end
    end
    
end

