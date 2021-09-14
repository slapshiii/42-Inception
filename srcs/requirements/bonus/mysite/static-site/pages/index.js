import Head from 'next/head'
import Image from 'next/image'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>Inception&apos;s static site</title>
        <meta name="description" content="Generated by create next app" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          Welcome to <a href="https://nextjs.org">Next.js!</a>
        </h1>

        <p className={styles.description}>
          This is the static website from phnguyen
        </p>

        <div className={styles.grid}>
          <a href="https://profile.intra.42.fr/users/phnguyen" className={styles.card}>
            <h2>My profil &rarr;</h2>
            <p>Link to my school profil</p>
          </a>

          <a href="https://github.com/slapshiii" className={styles.card}>
            <h2>My Github &rarr;</h2>
            <p>Where I store all my projects</p>
          </a>

          <a
            href="https://42.fr/"
            className={styles.card}
          >
            <h2>My school &rarr;</h2>
            <p>Discover a new way to learn</p>
          </a>

          <a
            href="https://nextjs.org/"
            className={styles.card}
          >
            <h2>Next.js &rarr;</h2>
            <p>How this site was build</p>
          </a>
        </div>
      </main>
    </div>
  )
}
