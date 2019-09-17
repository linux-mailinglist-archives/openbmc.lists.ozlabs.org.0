Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10325B58CD
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 01:59:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Y0Tb5NdmzF3CT
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2019 09:59:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ZyzXWiYr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="B1DFKemy"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Y0Sx6ttvzF1yc
 for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2019 09:59:13 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B2684220A9;
 Tue, 17 Sep 2019 19:59:10 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute4.internal (MEProxy); Tue, 17 Sep 2019 19:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=ka2AG
 C87sKrVRC1orpE3B5/+4GTjj5WEmKPSo1zhSDU=; b=ZyzXWiYrco53Xl1np9CG2
 cm/pi+wYrI5bcw3CMsfFmbsYkwTQy6T6PvXSBgw2K6fLohaC6hTAh4hQKNgD3kaZ
 6CR0/LoSpJz2p4T/rTfl3JMIO14DVuiNl1ojQbtt63jS3MVz5zpoMSuhNWY1cr1C
 ITeNBp0avPKtdWSYWuFJx6kwNz9UGFxdoLYeKKzuTsKr66y8aUv0duLPQ+gGTFuU
 tttBayhgOo0H4T5pd8JU3aY4e3g/9/N/1xAwyCEI0F114JSM0cWy262oUnGM3iU5
 xYHv1P2riKe3NWpkJ24S/BAK1PjoZe8PgG+Aff84Va0wY0qX3XN767sUPnhBiSVr
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ka2AGC87sKrVRC1orpE3B5/+4GTjj5WEmKPSo1zhS
 DU=; b=B1DFKemyCM9CENdgx6qTMbqkvPN118O4p/UIXEbgJLa9G2FXkNQf2jJP4
 ClErM0y3JwVxk1Y+e1Srjo7liPBCEHxUgddqFX7yKQl2/Uk/NtgtF2s/oUpYJhMa
 20MAX/h35zxAFiWDzEDTNP6my5Bh4YIKHgz9/ldNDgKY5ILcYtXu+MCdIYColuX1
 xDKRxFpxzyVJrcPStDHV4rcvSFTjIamFl+//eRZ1m6LuENnFYN5mzFsgBvqpeYdE
 gWg/sb7hOclW692z00bEp9nWQYkPTaXJHHGsBBmxmFOtjIKUC0nrsdNhVFhUEuNv
 1L7s1My2nsioZjiU2ZaIGCqvIKWNQ==
X-ME-Sender: <xms:TXOBXQEQhBI6x1543DDKeo5S3b0qChAPrOJZ5ONX-KMitnAf7rm9ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:TXOBXRkqAmWe6vwZmL7CvPS9ihBhI9mzLUFCky1z_5-W13l2GDnGpA>
 <xmx:TXOBXeHnaib6RTWDoncnF74fCg4Y3EJLfdQXG9Mqeh5q52WA2aBkIg>
 <xmx:TXOBXZaFDvBIMcqviD1hDVWpzKjOnsDDIgMi9N2hK0LQVGCgha7hxg>
 <xmx:TnOBXfdTWMb9eJuERc5weYnrz4WizB1s81dgMQ7CrVS3PmhMkpxdjg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A5CF6BC00C3; Tue, 17 Sep 2019 19:59:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <e9f88063-77e0-42e4-b63d-92d5b8d8c299@www.fastmail.com>
In-Reply-To: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
References: <DECB9459-108C-40DF-AB18-65A38169223D@fb.com>
Date: Wed, 18 Sep 2019 09:29:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Wilfred Smith" <wilfredsmith@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Andrew Geissler" <geissonator@gmail.com>
Subject: Re: BitBake Apache License and Packaging for OpenBMC Components
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
Cc: Andrew Geissler <andrewg@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> (5) How should I handle being in a subdirectory of a repository? The=20=

> code I=E2=80=99m checking in will go into openbmc-tools. How does that=
 work for=20
> CI?

There isn't any CI for openbmc-tools at the moment, as it was originally=

intended as a collection of quick hacks that made people's lives easier
without any particular guarantees. This was done to lower the bar for
entry and get people contributing their scripts.

CI is probably something we need to think about though, so I've added
Andrew G in To/Cc:

Cheers,

Andrew
