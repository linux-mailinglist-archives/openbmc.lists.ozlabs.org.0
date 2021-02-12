Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C6431A28C
	for <lists+openbmc@lfdr.de>; Fri, 12 Feb 2021 17:22:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dcf185299zDww4
	for <lists+openbmc@lfdr.de>; Sat, 13 Feb 2021 03:22:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dcf0M5hdTzDwl4
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 03:22:06 +1100 (AEDT)
IronPort-SDR: nAVImjWIDGrpLSUS/KY+SPRI/2MPT9DV4gAG67ZESgojv0vS+eqTK4abDJcv+/JJ95gkbt6IfD
 u/+X9iedUsxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9893"; a="162194514"
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="162194514"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 08:22:03 -0800
IronPort-SDR: fZ0a4W67s7nGlypkrdzd7D9bNsGq5fjyZ6xyGbrMZfjONbW89kOR5CffrsGd8MkSV1maJk/sQM
 iLE7yost4+WA==
X-IronPort-AV: E=Sophos;i="5.81,174,1610438400"; d="scan'208";a="398045408"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 08:22:03 -0800
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC List <openbmc@lists.ozlabs.org>
References: <YCXLqK7KgvwYwWDl@heinlein>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: Upcoming enhancements to `run-unit-test-docker`
Message-ID: <80c3bd03-7cdf-a22a-b5cb-ee05915ab04c@intel.com>
Date: Fri, 12 Feb 2021 08:22:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCXLqK7KgvwYwWDl@heinlein>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CYCtU9Vpk4Arcnw6FTF4jgwE7TszRSKTG"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CYCtU9Vpk4Arcnw6FTF4jgwE7TszRSKTG
Content-Type: multipart/mixed; boundary="kAfgd3EO3zui5sXONtf2xT2oiuupxouXp";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Message-ID: <80c3bd03-7cdf-a22a-b5cb-ee05915ab04c@intel.com>
Subject: Re: Upcoming enhancements to `run-unit-test-docker`
References: <YCXLqK7KgvwYwWDl@heinlein>
In-Reply-To: <YCXLqK7KgvwYwWDl@heinlein>

--kAfgd3EO3zui5sXONtf2xT2oiuupxouXp
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/11/21 4:28 PM, Patrick Williams wrote:
> Hello,
>
> Inside openbmc-build-scripts is a tool which is used by Jenkins to run
> repository-level CI and I think some developers also use it:
> `run-unit-test-docker`.  I've rewritten a component of this, which is
> now at `scripts/build-unit-test-docker`, in Python and done some
> enhancements to it.  The [currently] last commit in this sequence is at=

> [1].
>
> Important notices:
>
>      - Location change: build-unit-test-docker.sh ->
>        scripts/build-unit-test-docker
>          + I suspect few people run this directly, but instead use
>            `run-unit-test-docker` which hides the rename.
>
>      - Python3.6 minimum.
>          + Bitbake already requires this so it really shouldn't be a
>            problem for anyone.
>
>      - Python 'sh' module needed.
>          + You can install this with the 'python3-sh' package on many
>            distros or 'pip install sh'.
>
>      - Docker stages are now tagged with different names / tag revs.
>          + I wrote a `scripts/clean-unit-test-docker` which will clean
>            out old Docker tags and can be ran periodically.
>
> Major changes:
>
>      - Rewrite in Python.
>      - Significant speed improvements:
>          - Docker stages all build in parallel to formulate the final i=
mage.
>          - All Docker stages are tagged and reused from run to run.
>          - CMake packages now use the Ninja backend.  This is the same =
as
>            bitbake and faster than make.
>      - Included packages are defined in a dictionary rather than as raw=

>        Dockerfiles.
>
> Upcoming changes:
>
>      - Shortly, I will add support to incorporate base package changes
>        into the image itself.  We have had cases where a change to
>        a common package like `sdbusplus` broke CI because a package tha=
t
>        depended on it failed to compile with the changes.  I'll add cod=
e
>        that uses some of the GERRIT_* environment variables to determin=
e
>        if the commit-under-test is part of one of the base packages and=

>        include it in the Docker image for the test run.
>
>      - Topic-based testing.  We often run into co-dependencies between
>        phosphor-dbus-interfaces and another repository.  Within the nex=
t
>        month I'll enhance the script so that if you change PDI and your=

>        repository and tag the commit with the same topic, the PDI commi=
t
>        from that topic will be pulled into the Docker image so your
>        repository commit can pass CI.
>
>      - Some refactoring.  I did a lot of incremental changes from the
>        original shell script to the Python version I currently have and=

>        didn't always rewrite in the most Pythonic way.  There will be
>        some more, mostly non-functional, changes to fix this.
>
> Feel free to comment on the review series if you have any concerns with=

> these changes.
>
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+=
/40366
>
I tried using this script a day or two ago. I needed to fix some unit=20
tests for a commit I pushed earlier this month. I had used the script in =

the past and couldn't remember how to use it.

A year ago I had to fix some unit tests, and I had to get Docker, and=20
this test script configured. I have long since forgotten how I got the=20
system setup, so I went back to try and run the unit tests I had fully=20
configured and running from a year ago. In spite of having a fully=20
configured environment I could not figure out how to run the tests any=20
longer.

I decided to find the run-unit-test-docker.sh contents on the github=20
repos, to see if I could read prepared content for how to configure, and =

run the unit test script. The readme.md is one line. The comments in the =

shell script assume you know what each settable parameter does, and how=20
it is to be assigned.

I'm pretty sure I had 1:1 assistance from someone familiar with the test =

configuration to get this to work. The effort involved is more than "get =

docker, run script".

I request that someone familiar with the configuration and operation of=20
this script please provide information about how to get the environment=20
configured, and some example use cases for running the system. One place =

in particular that I found difficult/impossible was to run a test on=20
code that required changes in other repositories. For example, if=20
phosphor-network needed changes that are provided by=20
phosphor-dbus-interfaces how would you configure the test run to be=20
successful?

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--kAfgd3EO3zui5sXONtf2xT2oiuupxouXp--

--CYCtU9Vpk4Arcnw6FTF4jgwE7TszRSKTG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmAmqyoFAwAAAAAACgkQOcg9x5uaKcB3
Lgf/aMuOiIyeWMvZYFvsduvdI6qufa+4J/tFWlhdPwk5TEQd4mYbatcdAGJLEM7EZ0EjsszXma37
JoTStGP0upyaeVnAFwQ9mmIRsFFcNosaGx8Nsjgb7u6uFCKRO9MqGBAQipAapWnidUjZn2/58aZ0
D8O/BvmmmcesbFUvetKhTj4xjlU1VpoDTyWBvCuwVI7FyU4yMSw6QjKFdhBMMwEthL9LhsyVzGuS
q8s1U71/F6xbVzQa9Ymi+IXxKj86NrXCNJh1yE4K056/xp3WzJbvkxKTwCvhV3JC6UJ1kXmeebxs
sGQh/XIo7YTU8M8OUcLhOg32LufpFQvbQojtQTLz4Q==
=K7W9
-----END PGP SIGNATURE-----

--CYCtU9Vpk4Arcnw6FTF4jgwE7TszRSKTG--
