Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2217B5EF
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 06:03:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Yb8z3Xp9zDqxf
	for <lists+openbmc@lfdr.de>; Fri,  6 Mar 2020 16:02:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=wHK4TLiE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eg6qebD8; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Yb885h53zDqvr
 for <openbmc@lists.ozlabs.org>; Fri,  6 Mar 2020 16:02:16 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 744C5611;
 Fri,  6 Mar 2020 00:02:12 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 06 Mar 2020 00:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=tLnqQ
 qdMsxAUTv0xUiuK/ZAT08NGT0hoMfxpgfpCLfQ=; b=wHK4TLiEtzVmH//MvEExJ
 a5/r/YmVE9adMdbLwj70oMToRjcvkHIDJci6qkMmYL1RH4yYA/5e5C3itbtj/Uui
 J68Bu75qsBubj/V8RPj87NxAlWCN2iiw7rt02SRaWpGVZILMyXmZwjq6rTFjEydF
 k+NTOuxxoqivb28WdQw0gpmMk9w8faiDchjiiH6Usp/mVz6FsLtiOuM0/xFidliV
 JaPvHb9nRYovXCh0JPEonvenR5PXX5gwRj86E5Ku2Y8CrD8qq3OdZzTytl22h5F/
 OQY4HMBGUJZa9PKOqdIJqka5WwCQAE//ZnmopveH5llVP8zkUm4On4uvcnnC9lzv
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tLnqQqdMsxAUTv0xUiuK/ZAT08NGT0hoMfxpgfpCL
 fQ=; b=eg6qebD8Th04iev0VGy1evdEZhfd8QepBCnsVFSN+umZzq+uY0G+J215u
 SQX+KYRHaYZ48Flq4OnyMSPBffZsKOYBk7jp3pzxRX2azBfUmGR+sXQQdUX+bknU
 nBXoe02S348HSvhA75VcmCh7z6AAkifAvFwtLAgekGPBj9SsKSoaB1iYOk8mxiib
 F/yQnmK7b0whloWUUoWnYhhD0xItAWmrp7jZFZhBtavEXcK7MPx3vBen25OR4p2h
 rvmcW2TT8xmejxVq/j1qy5rmj8qBzhvaw5z+1RU6Wb8+LoTZdI0VA3SiVu4P4Brn
 5KufaHPqB0AjLWulHMDlxK4NQEHfQ==
X-ME-Sender: <xms:U9lhXjWnz_ZAnCxqDXfW52k50uZSLHSG_Y1J_K3x9DIH5kqEdipvwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduuddgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinhepfhhrvggvuggvshhkthhophdrohhrghdptghonhhfrdhithdpphhrohhofhhp
 ohhinhhtrdgtohhmpdhosghmtgdqvdgutghonhhsohhlvgdqhehfghhithdrsggsnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruh
X-ME-Proxy: <xmx:U9lhXr-bRvdjTz3j6P3j0-KpaMoqmZZHaEDEGJK70tl7mNgLwxxmVA>
 <xmx:U9lhXpDWgTlRVpcrUdhWKtutAw2n-R8waTO9e5fhryRKaJ0M22dbDw>
 <xmx:U9lhXvoM5_v5bSwU8nL7CHjeFY4V1eAKj29B5o4gK4RMgLYuiFrlJw>
 <xmx:VNlhXpA67-cTk7X1Svk0EjA4elNtEuGkuQqIEWvSMqtH9pOnVdrGAQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4348EE00C2; Fri,  6 Mar 2020 00:02:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-991-g5a577d3-fmstable-20200305v3
Mime-Version: 1.0
Message-Id: <646b5353-1746-4cc5-8ea8-0e85ceff4ac0@www.fastmail.com>
In-Reply-To: <F0FD3E1A-1CB4-48B1-B56B-9D03167ABEDE@fb.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <2e540aa6-1540-46b2-af33-57ddb5ec9554@www.fastmail.com>
 <F0FD3E1A-1CB4-48B1-B56B-9D03167ABEDE@fb.com>
Date: Fri, 06 Mar 2020 15:31:50 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: obmc-console design for multi host support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

On Fri, 6 Mar 2020, at 08:28, Vijay Khemka wrote:
> Hi Andrew,
> I have a question as why do we need obmc-console-ssh.socket and=20
> obmc-console-ssh@.service.=20

obmc-console-ssh.socket is not used in the concurrent-server context.
It can't be, for reasons outlined below.

obmc-console-ssh@.service is always required, but how it works changes
based on whether obmc-console-ssh.socket is used or not. The behaviour
is changed by the presence or absence of
obmc-console-ssh@.service.d/use-socket.conf which overrides the
ExecStart property of obmc-console-ssh@.service and requires the
presence of obmc-console-ssh.socket.

Prior to implementing concurrent server support in obmc-console, the
dropbear instance that launches the clients was itself launched using
systemd socket-activation:

https://www.freedesktop.org/software/systemd/man/systemd.socket.html

This has the benefit of minimising memory consumed in the system by not
starting dropbear until the first connection is received. The updates to=
 the
obmc-console recipe that pull in the upstream concurrent-server support
maintain this behaviour for systems that do not require concurrent-serve=
r
support (all platforms supported upstream), however due to systemd
constraints on the interaction between socket and service units it's not=
=20
possible to use socket-activation and support concurrent servers in a
generic fashion.*

So to clarify,  the changes to the obmc-console.bb recipe assumes by
default that the system it's being installed on does _not_  require
concurrent-server support, and as a consequence configures the package
to install obmc-console-ssh.socket and
obmc-console-ssh@.service.d/use-socket.conf. It is necessary to opt-in t=
o
enabling concurrent-server support in a bbappend, and doing so requires
changes similar to those outlined in my previous email. Configuring the
package with --enable-concurrent-servers will install _neither_
obmc-console-ssh.socket _nor_
obmc-console-ssh@.service.d/use-socket.conf (in-fact, this is all the
--enable-concurrent-servers configure switch controls). The declarations=

needed in the .bbappend enabling concurrent-servers roughly fall into
two categories:

1. Telling bitbake about the extra server/client configuration files
2. Modifying bitbake variables to remove the units that won't be install=
ed
(i.e. obmc-console-ssh.socket and
obmc-console-ssh@.service.d/use-socket.conf)

Hope that helps.

Andrew

* Specifically, when systemd starts the service associated with a socket=
 unit
the parameter for the service template unit is a unique integer that has=
 no
association with the template parameter for the socket unit. This means
we can't have the port number passed from the socket unit to the service=

unit as a template parameter and therefore don't know which configuratio=
n
to choose in the service unit. The only way to make this work is to defi=
ne
pairs of socket and service units that have the port baked into the serv=
ice
name (as the service unit still must be a template to support the connec=
tion
number). That's quite awkward, so I just chose to instantiate the dropbe=
ar
instances directly and avoid socket-activation.


> Especially when using in concurrent servers do we need to create these=
=20
> for each client/server socket?
>=20
> This may be a basic question but I want to understand this more.
>=20
> Regards
> -Vijay
>=20
> =EF=BB=BFOn 3/2/20, 8:19 PM, "openbmc on behalf of Andrew Jeffery"=20
> <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of=20=

> andrew@aj.id.au> wrote:
>=20
>    =20
>    =20
>     On Thu, 27 Feb 2020, at 20:34, Andrew Jeffery wrote:
>    =20
>     >=20
>     > You'll need a .bbappend file with a do_install_append() in your =
machine
>     > layer to install the rest of your configuration files.
>     >=20
>    =20
>     Just following up on the .bbappend - the change for the base recip=
e is here:
>    =20
>    =20
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-=
2Dproject.xyz_c_openbmc_meta-2Dphosphor_-2B_29747_1_recipes-2Dphosphor_c=
onsole_obmc-2Dconsole-5Fgit.bb&d=3DDwIBAg&c=3D5VD0RTtNlTh3ycd41b3MUw&r=3D=
v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3D1-CxtAkTLEtpmrw0zNxaJWDW=
KC1n3zMEPSWErzgz6Ow&s=3D4F0YCLIwY_2nNtoNQ3nhkPlN1iU1d8O2EX3cOhtz8no&e=3D=
=20
>    =20
>     In that context, .bbappends for enabling concurrent console server=
s should
>     look something like this for an example machine called 'foo':
>    =20
>     ```
>     FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>    =20
>     SRC_URI +=3D "file://server.ttyVUART0.conf"
>     SRC_URI_append_foo =3D " file://client.2201.conf"
>     SRC_URI_append_foo =3D " file://server.ttyVUART1.conf"
>    =20
>     SRC_URI_remove =3D "file://$%7BBPN%7D.conf"
>    =20
>     REGISTERED_SERVICES_${PN}_append_foo =3D " obmc_console_guests:tcp=
:2201:"
>    =20
>     SYSTEMD_SERVICE_${PN}_append_foo =3D " obmc-console-ssh@2200.servi=
ce \
>     		obmc-console-ssh@2201.service \
>                     "
>     SYSTEMD_SERVICE_${PN}_remove_foo =3D "obmc-console-ssh.socket"
>    =20
>     FILES_${PN}_remove_foo =3D=20
> "/lib/systemd/system/obmc-console-ssh@.service.d/use-socket.conf"
>    =20
>     EXTRA_OECONF_append_foo =3D " --enable-concurrent-servers"
>    =20
>     do_install_append_foo() {
>             # Install configuration for the servers and clients. Keep=20=

> commandline
>             # compatibility with previous configurations by defaulting=
=20
> to not
>             # specifying a socket-id for VUART0/2200
>             install -m 0755 -d ${D}${sysconfdir}/${BPN}
>    =20
>             # Remove the default client configuration as we don't to d=
efine a
>             # socket-id for the 2200 console
>             rm -f ${D}${sysconfdir}/${BPN}/client.2200.conf
>    =20
>             # However, now link to /dev/null as a way of not specifyin=
g=20
> a
>             # socket-id while having a configuration file present. We=20=

> need to
>             # provide a configuration path to meet the requirements of=
=20
> the packaged
>             # unit file.
>             ln -sr ${D}/dev/null=20
> ${D}${sysconfdir}/${BPN}/client.2200.conf
>    =20
>             # We need to populate socket-id for remaining consoles
>             install -m 0644 ${WORKDIR}/client.2201.conf=20
> ${D}${sysconfdir}/${BPN}/
>    =20
>             # Install configuration for remaining servers - the base=20=

> recipe
>             # installs the configuration for the first.
>             install -m 0644 ${WORKDIR}/server.ttyVUART1.conf=20
> ${D}${sysconfdir}/${BPN}/
>     }
>     ```
>    =20
>     Hope that helps.
>    =20
>     Andrew
>    =20
>=20
>
