import numpy as np
import click


@click.command("update")
@click.option('--new_dg', help="new id of data generation")
@click.option('--cluster_id', type=int, help='cluster id to replace')
def update_centoroid(new_dg: str, cluster_id: int):
    current_centroids = np.load('/opt/indices/clust_centers.npy')
    new_centorids_clust = \
        np.load(f'/storage/dgs/dg_{new_dg}/clust_centers.npy')[cluster_id, :]
    current_centroids[cluster_id, :] = new_centorids_clust
    np.save('/opt/indices/clust_centers', current_centroids)

if __name__ == '__main__':
    update_centoroid()
