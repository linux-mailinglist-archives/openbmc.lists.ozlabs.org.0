Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7187E1714A9
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 11:05:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SpFd29xvzDqwP
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 21:05:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=hR/BBbo3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jCY/WzWq; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SpDq3MVzzDqvx
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 21:04:42 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 082F621DC6;
 Thu, 27 Feb 2020 05:04:39 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 27 Feb 2020 05:04:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=AfebaBlEk23cMeFljThFt4//gS5LjWS
 Frlc35BXYJpU=; b=hR/BBbo3Etg7c2rw8HeTo4MHcB3yWiFC46Z79VvluOH6r5r
 +vCtpzlicuj7Hs+4K/9J8Em9VHgwMJroJ2c8tzWcVGOi1emZ+fQIV/v1n37V1/Nc
 bmmFKy0zbiIt4dcqfWDreSrpOpnOHOrCpXyRmAtI/86nUjKWwWplHFxoaELvyD6o
 aofZhlI3ncbwESC8tPlRWddyPdMprpX+vLRdsJrocd/OQlpEa8SPCCadX0U/aNH7
 IJmRYpER5b0nMdwORKCqF7gk/8hLzPGJv4RkVUS32vCAsxepc7Mz1qNaek+zCzpa
 4Dh+ZA58TDkHp5BaQ78nMOW4wJJKKhgqP5F5/YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AfebaB
 lEk23cMeFljThFt4//gS5LjWSFrlc35BXYJpU=; b=jCY/WzWq4I93FT20s0Ywne
 qEkK87B/X5HPmQ5jLRxk6Hkgr//a0nABUSPuHCHaWqGpUIw/KYQRpSAx24GkaTan
 Kwyibd/u2Xu3B+cR62FvLarkmu1IfaJGXuMY9sD0RPDTCx0/S/6mJYiiWLXvp2ft
 oCvZWodLOTmWXnaQvdhqtX2jllOwBPMreSM7iv4IY8OrvxUX9I9mP9oqRxIwkevu
 RlVRfYoONeKXo+zlIq9tw/tKCywllFJR2mrt0mZ7mewDVi8VkXFdbcQ6TqqT0ZDV
 A/IzEiNiqrV1RF7j3XhH4ggpkoGB4ch9wPnNWCInuNZP8WT6AbFMKLaHIac+iPNQ
 ==
X-ME-Sender: <xms:NZRXXk7NZussy6Vn2s5A5zUxkZGP7RcOAb_kNMQu74vB3N98ySUJ1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeigdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiii
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:NZRXXtj22HYIazceXelzj75rXBvnKWLVKWn74dMnXSE41Zio-JnMRA>
 <xmx:NZRXXjoxEH0MmYh1uj2FkeLd_8TGcL3PTV5NvCDg7U3e2FX0xpojng>
 <xmx:NZRXXhL3WOBzA_5ZMKzgIHYR6TA2wgqxIin0z6wKK4tlk_lZskSmXw>
 <xmx:NpRXXpGBbNaPFbXdiMEd02bS7DBSxReWn5aVzclPSyClL6IwZVbmRg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8BCCAE00A2; Thu, 27 Feb 2020 05:04:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
In-Reply-To: <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
Date: Thu, 27 Feb 2020 20:34:33 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Kumar Thangavel" <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-console design for multi host support
Content-Type: text/plain
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kumar,

On Thu, 27 Feb 2020, at 02:29, Kumar Thangavel wrote:
> Hi Andrew,
> 
>              Could you please suggest how to add configs for multiple host ?

Sure. So the root problem is mapping a given obmc-console-client to
the correct obmc-console-server instance. We do this by giving the
unix domain socket created by the server a unique name in the
abstract socket namespace. The client is associated with a unique
network port and the server a unique tty device (e.g. ttyVUART0),
but neither the port nor the tty should be associated with the abstract
socket's name as to do so means the port or tty name becomes a
mapping that's hard to break (port X always implies tty Y). The route
the patches take is to pair a client with a server via a socket-id value
read from a configuration file (one patch enables the client to read a
configuration file [1]).

[1] https://gerrit.openbmc-project.xyz/c/openbmc/obmc-console/+/29457

All connections to the client a given port should map to one associated
server. Given that the port is unique for the client and the tty for the
server, we can define which configuration they should use in terms of
the port or tty, which leads to the following configuration structure:

```
$ ls -1 /etc/obmc-console
client.2200.conf
server.ttyVUART0.conf
```

So to map the client associated with port 2200 to the server associated
with ttyVUART0 we set the same socket-id value in both files:

```
$ grep socket-id /etc/obmc-console/*.conf
client.2200.conf:socket-id = host
server.ttyVUART0.conf:socket-id = host
```

You can add further instances to the system by adding e.g.
client.2201.conf and server.ttyVUART1.conf and set the same socket-id
value in each. This brings us to the issue of getting the client and
server up and running - they are integrated into the running system
via the two template systemd service units: obmc-console@.service
and obmc-console-ssh@.service:

```
$ cat /lib/systemd/system/obmc-console@.service
[Unit]
Description=%i Console Server
ConditionPathExists=/etc/obmc-console/server.%i.conf

[Service]
# Instance ID is the VUART basename
ExecStart=/usr/sbin/obmc-console-server --config /etc/obmc-console/server.%i.conf %i
SyslogIdentifier=%i-console-server
Restart=always
```

```
$ cat obmc-console-ssh@.service
[Unit]
Description=Console Client on %i
Wants=dropbearkey.service
After=dropbearkey.service

[Service]
# Unit defaults to a templated service
Environment="DROPBEAR_RSAKEY_DIR=/etc/dropbear"
EnvironmentFile=/etc/default/dropbear
EnvironmentFile=-/etc/default/obmc-console-client
ExecStart=/usr/sbin/dropbear -r ${DROPBEAR_RSAKEY_DIR}/dropbear_rsa_host_key -c "/usr/bin/obmc-console-client -c /etc/obmc-console/client.%i.conf" -p %i -F $DROPBEAR_EXTRA_ARGS
SyslogIdentifier=console-client-%i
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
```

We realise the obmc-console-ssh@.service template by installing a
obmc-console-ssh@2200.service symlink and adding it to the default
target. We realise the obmc-console@.service template by installing
a custom udev rule to trigger the start of the server on the appearance
of the associated tty device (the `ENV{SYSTEMD_WANTS}=` attributes):

```
$ cat /lib/udev/rules.d/61-aspeed-vuart.rules
SUBSYSTEM=="tty", ATTRS{iomem_base}=="0x1E787000", ENV{SYSTEMD_WANTS}="obmc-console@ttyVUART0" SYMLINK+="ttyVUART0", TAG+="systemd"
SUBSYSTEM=="tty", ATTRS{iomem_base}=="0x1E788000", ENV{SYSTEMD_WANTS}="obmc-console@ttyVUART1" SYMLINK+="ttyVUART1", TAG+="systemd"
```

This set of udev rules can be used generally, as due to the
`ConditionPathExists=/etc/obmc-console/server.%i.conf` directive in
obmc-console@.service we won't attempt to run obmc-console-server
unless the associated configuration file is installed.

You may want to review the following patches to understand how to
integrate the configurations into your machine's configuration in
bitbake:

https://gerrit.openbmc-project.xyz/q/topic:%22concurrent-consoles%22+(status:open%20OR%20status:merged)

You'll need a .bbappend file with a do_install_append() in your machine
layer to install the rest of your configuration files.

More work needs to be done to handle the case where your BMC image
caters to multiple platform configurations, but this is at least a start to
handling multiple console servers.

Hope that helps!

Andrew
