Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05540176DEF
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 05:19:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WkKk0fWDzDqcc
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 15:19:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=h/uY3mE5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Z84G3G4k; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WkK51FLszDqTP
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 15:18:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B7A8A3E1;
 Mon,  2 Mar 2020 23:18:30 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 02 Mar 2020 23:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=mrtTa9i11F4Nbd4FUhvGsRzlZdpwwUA
 Er68iI+m9RRo=; b=h/uY3mE5e5Fhs0kAlWRtSzJTx6a/VByHQW7iubEZ866xwOm
 Ebz8jOh+f4X5Dvj/wQkmVjCu1vcCq7a63LTYCrM5AcGJwLbBCyRNK6aR5ITQz6Lj
 sa/hftJy8aUwPe87Qz/3Jk76T8dK5ahaP19uxIsvBNa0hgwy0W1boBsE1DDyjCsh
 1cmfi54Ap14qzgVJr4q4gf4FfhFDb9WOADkdyfzuLan46gc1rZQKMV3SlSgiX26f
 YW/UnJprH1txeSmYwVzCuGzbX94D2IJecnNaFUUnjBAPnGdC+pmZchCu5P2/L2lp
 ckGuo2IoPv9C7h7J/xFI4ar80sZtamIBKiI2Cyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mrtTa9
 i11F4Nbd4FUhvGsRzlZdpwwUAEr68iI+m9RRo=; b=Z84G3G4khWasWoswoaryd2
 QsbHime+7++PayA1tCeuQifRnOIj4Svkl/BoaSsdw5eBViqET9MjJLJsiLAsSRSq
 CYvOuy8/+RSoBJsHuq1L86FqjH5K1uauSW01ehlojIbav6qZRaVM+HBI1F8SYmDb
 qoKSiqIXqgGdeUY1b0ibACXMQnAAThcwaVxplxPSck6TFqP08daCREkBuCqIzqix
 gvKedIEOICNDLP25uaqzvFA3xD+px2VKOTU3xPcNVkXhKCnxPDrP/43Eqp53sbNn
 7036GvO+5zIT61QK+UNe2kQg3bKbUoTAKBRGdfGJIPhN2D/moUykHVROGw2b9KZA
 ==
X-ME-Sender: <xms:ldpdXoPCCl-i-YeLPnU7_UShXewQSeprgnxwY8Uh2hIKpveHuD0N_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddthedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtsehttdertder
 redtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiih
 iienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ldpdXuB-g5te1RFzvajUHIdjfEkzV2opWyzIe4kQRcWqljz4CQ7dlA>
 <xmx:ldpdXlcDByUpBtxFEyaNvTkApDc7Ka8OZpCUnKKvvlWv3YDOox44GA>
 <xmx:ldpdXtOzGQxw8OvVIgEnjsNzkDzYn-a5BCgPz9v1GEMppvnAN-BJmA>
 <xmx:ltpdXgSPClaSvURiYYTKqN5G5AWXzUpfWDde87t7j4tqGrCBvB3zNg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8D99CE00C2; Mon,  2 Mar 2020 23:18:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <2e540aa6-1540-46b2-af33-57ddb5ec9554@www.fastmail.com>
In-Reply-To: <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
Date: Tue, 03 Mar 2020 14:48:29 +1030
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



On Thu, 27 Feb 2020, at 20:34, Andrew Jeffery wrote:

> 
> You'll need a .bbappend file with a do_install_append() in your machine
> layer to install the rest of your configuration files.
> 

Just following up on the .bbappend - the change for the base recipe is here:

https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/29747/1/recipes-phosphor/console/obmc-console_git.bb

In that context, .bbappends for enabling concurrent console servers should
look something like this for an example machine called 'foo':

```
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://server.ttyVUART0.conf"
SRC_URI_append_foo = " file://client.2201.conf"
SRC_URI_append_foo = " file://server.ttyVUART1.conf"

SRC_URI_remove = "file://${BPN}.conf"

REGISTERED_SERVICES_${PN}_append_foo = " obmc_console_guests:tcp:2201:"

SYSTEMD_SERVICE_${PN}_append_foo = " obmc-console-ssh@2200.service \
		obmc-console-ssh@2201.service \
                "
SYSTEMD_SERVICE_${PN}_remove_foo = "obmc-console-ssh.socket"

FILES_${PN}_remove_foo = "/lib/systemd/system/obmc-console-ssh@.service.d/use-socket.conf"

EXTRA_OECONF_append_foo = " --enable-concurrent-servers"

do_install_append_foo() {
        # Install configuration for the servers and clients. Keep commandline
        # compatibility with previous configurations by defaulting to not
        # specifying a socket-id for VUART0/2200
        install -m 0755 -d ${D}${sysconfdir}/${BPN}

        # Remove the default client configuration as we don't to define a
        # socket-id for the 2200 console
        rm -f ${D}${sysconfdir}/${BPN}/client.2200.conf

        # However, now link to /dev/null as a way of not specifying a
        # socket-id while having a configuration file present. We need to
        # provide a configuration path to meet the requirements of the packaged
        # unit file.
        ln -sr ${D}/dev/null ${D}${sysconfdir}/${BPN}/client.2200.conf

        # We need to populate socket-id for remaining consoles
        install -m 0644 ${WORKDIR}/client.2201.conf ${D}${sysconfdir}/${BPN}/

        # Install configuration for remaining servers - the base recipe
        # installs the configuration for the first.
        install -m 0644 ${WORKDIR}/server.ttyVUART1.conf ${D}${sysconfdir}/${BPN}/
}
```

Hope that helps.

Andrew
