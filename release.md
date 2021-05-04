# Release Guide
All committer should follow these steps to do release for this repo.

1. Prepare the official release.

- Update the [CHANGES.md](CHANGES.md).
- Create a new `skywalking-kong-x.y-z.rockspec` file under [rockspec](/rockspec).

2. Package the source release.

```shell
> export VERSION=x.y.z
> make release-src
```

Use SVN to upload the files(tgz, asc and sha512) in the `release` folder to `https://dist.apache.org/repos/dist/dev/skywalking/kong/x.y.z`.

3. Make the internal announcements. Send an announcement mail in dev mail list.

```
[ANNOUNCE] SkyWalking Kong x.y.z test build available

The test build of x.y.z is available.

We welcome any comments you may have, and will take all feedback into
account if a quality vote is called for this build.

Release notes:

 * https://github.com/apache/skywalking-kong/blob/vx.y.z/CHANGES.md

Release Candidate:

 * https://dist.apache.org/repos/dist/dev/skywalking/kong/x.y.z/
 * sha512 checksums
   - xxxxxxx  skywalking-kong-x.y.z-src.tgz

Release Tag :

 * vx.y.z

Release CommitID :

 * https://github.com/apache/skywalking-kong/tree/xxxxxxxxxx

Keys to verify the Release Candidate :

 * https://dist.apache.org/repos/dist/release/skywalking/KEYS


A vote regarding the quality of this test build will be initiated
within the next couple of days.
```

4. Wait at least 48 hours for test responses. If there is a critical issue found and confirmed by the PMC, this release should be cancelled.

Once the vote cancelled, send a cancelled mail with `[CANCELLED][VOTE]` as the prefix of the mail title at first. And then re-send mail with title prefix `[VOTE][ROUND N]` for calling a new vote.

5. Call for a vote. Call a vote in dev@skywalking.apache.org

```
[VOTE] Release SkyWalking Kong x.y.z

This is a call for vote to release Apache SkyWalking Kong version x.y.z.

Release notes:

 * https://github.com/apache/skywalking-kong/blob/vx.y.z/CHANGES.md

Release Candidate:

 * https://dist.apache.org/repos/dist/dev/skywalking/kong/x.y.z/
 * sha512 checksums
   - xxxxxxx  skywalking-kong-x.y.z-src.tgz

Release Tag :

 * vx.y.z

Release CommitID :

 * https://github.com/apache/skywalking-kong/tree/xxxxxxxxxx

Keys to verify the Release Candidate :

 * https://dist.apache.org/repos/dist/release/skywalking/KEYS


Voting will start now (xxxx date) and will remain open for at least 72 hours, Request all PMC members to give their vote.
[ ] +1 Release this package.
[ ] +0 No opinion.
[ ] -1 Do not release this package because....

```

5. After 72Hours passed, send a mail to announce ones the result. Let `[RESULT]` as the mail title prefix. Go on to step 1, if vote failed. 

6. Prepare to publish release, if vote passed.

Move the release from RC folder to the dist folder. This will begin the file sync across the global Apache mirrors.
```
> export SVN_EDITOR=vim
> svn mv https://dist.apache.org/repos/dist/dev/skywalking/kong/x.y.z https://dist.apache.org/repos/dist/release/skywalking/kong
....
enter your apache password
....
```

7. Publish release.

Please update the SkyWalking-Website first.

Then please remove the old version packages, after ensuring the mirror of the new version is available.
```
> svn delete -m "remove old version a.b.c" https://dist.apache.org/repos/dist/release/skywalking/kong/a.b.c
....
enter your apache password
....
```

Finally, send ANNOUNCE email to `dev@skywalking.apache.org`, `announce@apache.org`, the sender should use Apache email account.
```
Mail title: [ANNOUNCE] Release Apache SkyWalking Kong version x.y.z

Mail content:
Hi all,

Apache SkyWalking Team is glad to announce to release Apache SkyWalking Kong version x.y.z.

SkyWalking: APM (application performance monitor) tool for distributed systems,
especially designed for microservices, cloud native and container-based (Docker, Kubernetes, Mesos) architectures.

SkyWalking Kong Agent provides the native tracing capability for Kong.

This release contains a number of new features, bug fixes and improvements compared to
version a.b.c(last release). The notable changes since x.y.z include:

(Highlight key changes)
1. ...
2. ...
3. ...

Please refer to the change log for the complete list of changes:
https://github.com/apache/skywalking-kong/blob/vx.y.z/CHANGES.md

Apache SkyWalking website:
http://skywalking.apache.org/

Downloads:
http://skywalking.apache.org/downloads/

Twitter:
https://twitter.com/ASFSkyWalking

SkyWalking Resources:
- GitHub: https://github.com/apache/skywalking
- Issue: https://github.com/apache/skywalking/issues
- Mailing list: dev@skywalkiing.apache.org


- Apache SkyWalking Team
```

8. upload rockspec file to luarocks.org
login to [luarocks.org](https://luarocks.org/), the user name is `apache-skywalking` and the password has been sent to `private@skwalking.apache.org`.

Then upload the rockspec file and you can use the `luarocks` command line to install the new version.
