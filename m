Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B309850BBD
	for <lists+openbmc@lfdr.de>; Sun, 11 Feb 2024 23:16:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PZ213ZZk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TY23d44QGz2yq4
	for <lists+openbmc@lfdr.de>; Mon, 12 Feb 2024 09:15:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PZ213ZZk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TY2300ZvTz2ydW
	for <openbmc@lists.ozlabs.org>; Mon, 12 Feb 2024 09:15:23 +1100 (AEDT)
Received: from heihei.fritz.box (ppp14-2-125-29.adl-apt-pir-bras32.tpg.internode.on.net [14.2.125.29])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E548620135;
	Mon, 12 Feb 2024 06:15:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707689720;
	bh=8kk14XBEn7c7NARrcPHfitbwnvulfjNKeoNxPQTa0Zw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PZ213ZZkiddJ82W2oGHeB/WMwfQGR1aibrefmtMLlYIexERnTUzgU87+ccgNlqeZh
	 PliMsvYFX4Mpa9Ji9V3BAjMMniOinKUGk6NWSGPC5K++TnZ71apvnQVnZJzESZQJyo
	 CUBK+CdwbesvJ5dQbw63v8jWaXIkKaeBpUaSzrbnJ1LVCjla01sNX3mCK/KdsAOPE1
	 fPmoSrEoB5N98X0Q9CmvUsq0fZV2sFJFXD/oz0mcYKmLv26Xn3CAyCa27TSE6sbsbq
	 8QtQy0ta4x9h3ADgHeslAHKoJyedY1WYWQamHCq4oJW/JkW4PiTurGQTO9+GUQTg81
	 x007TYIrCyTnA==
Message-ID: <eb3d9ef1f305cc11f95ac41df3bbaa95e094d073.camel@codeconstruct.com.au>
Subject: Re: File Manager Service in OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Sunitha Harish <sunithaharish04@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 12 Feb 2024 08:45:12 +1030
In-Reply-To: <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
	 <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
	 <f7de9480-d92e-462b-ac8f-8e1d3c90b886@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Sunitha,

On Fri, 2024-02-09 at 11:23 +0530, Sunitha Harish wrote:
> Thank you Andrew for the reply.
>=20
> When IBM manages a single server with multiple management=20
> clients(redfish clients), they need to save some server related data=20
> (host data) in the form of files at BMC's persistent file system.
>=20

What are the specific use-cases though? It seems that we've jumped
straight to an implementation detail (persisted files) when it's not
clear to me *what* it is that's needing to be communicated to begin
with.

>  Here=20
> BMC is used as a common persistent storage, which is accessible to all=
=20
> connected redfish clients.

Okay, but why is that necessary? Can you please enumerate the use-
cases?

The use-cases are what allows us to find an intersection of interests
with others in the community.

Discussions in the abstract in the context of a specific implementation
approach feel to me like they might struggle to gain traction.

>=20
> Additionally, for IBM usecase, BMC need not consume these files, as they=
=20
> are targeted to be used by the host/hypervisor.=C2=A0
>=20

If they're not used by the BMC can you unpack why they need to be
stored on the BMC?

Andrew
