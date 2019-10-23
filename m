Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F71E0ED6
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 02:00:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yVrF6tt3zDqQd
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 11:00:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="C3UWLuJx"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="q17gjQNL"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yVqT1Yd4zDqPg
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 10:59:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1DBD421FEB;
 Tue, 22 Oct 2019 19:59:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 22 Oct 2019 19:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=QcJoS
 0+GxGdUU6BQ9Do7Vq82fYWkGJycsFgXDIkG/ts=; b=C3UWLuJxxzdw+pSTVL6JK
 kPN0KkDOnNpWc+vcdzEcPSC8HgceeChEv1eZA6OCFoh1I2PF3MI/xBNjqTHezoea
 o/+7HYjstiz5qmhXjEenbNg9QZ0jnnnSqvpXytC9AiU+GVykjXh1XRFb3bRJF0g2
 eH2gVWlxjbyEB9vuEH8mQAGUIReThUY4hMs2Cwe0cE0otfOmD7cZOSx8BivrXLg+
 jcHTf8CjcBR3K5su7nrO/MRJcHHtLPYJyUPzZ0jKm8Y5jIXGO9D5wzgti5pWfAbP
 OibX6xQqXN/T4Kd1ZqvF3JUQkvqmkzaWUBiVLJSGt0fuVifBk456tnLsrNu0iEyF
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=QcJoS0+GxGdUU6BQ9Do7Vq82fYWkGJycsFgXDIkG/
 ts=; b=q17gjQNL4HPXFGFSpwheK0XURVgIfH2nohFFWxQdQ7c9l1dTyJnsZePhF
 gXGyxKr9w/wtY6KK4o3lv8iaLLxZkLrjrm5WYAz3KShEk2wKvOCKHtrspxPMV0fC
 Y5qsCoup3OCKRucXiKshkPLfHvZsEJa6asa/0qWNjQgJZe7jDN8rJ+QqYsjwDHoj
 guKOgkaqkkDHdH8ecUwl5d+acjQUGCfCo5phyf5+pRJoAEJua09500u6anREX5HO
 vHX3KEE9VIBOFKSZCsk0OCiRkye+3gyeoZ1+BoQZQGqlUwjzbBKlLQrP6zpSJspT
 JgtWbv7npMsLGPYlucJi+28j1A/Vg==
X-ME-Sender: <xms:75evXd1Fwf7WGYxmIkzklPCgRQ6Vz1pEAG5hhKkPRrlrqy0aQ57lPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeekgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:75evXQVOFprRAenaxQqAaFIJQLSlsf9HuoEjLPuI8kHJ141O_I0OVQ>
 <xmx:75evXXg-HAQEi3yWeECY37iLRCAh7iFYSzehSoQvnrVgv1qsXsf7SA>
 <xmx:75evXbKa5TlFuu59Spo-0qr15ioWIDM2hUfmA4WJNVGG3f8QWPLtIg>
 <xmx:8JevXZutuFnHny4g_EeRtO09TGnK6LdxAL1X78yRnjyowEsZKi3KNA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 29B30E00A5; Tue, 22 Oct 2019 19:59:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <606d90d5-5538-4232-88f0-77961022dfa7@www.fastmail.com>
In-Reply-To: <b6a3c0af-a6e3-e122-02c4-44a18138f66d@linux.intel.com>
References: <20191022044737.15103-1-andrew@aj.id.au>
 <20191022044737.15103-3-andrew@aj.id.au>
 <081e769c-7f48-d8d9-9c7f-6715c895640c@linux.intel.com>
 <b6a3c0af-a6e3-e122-02c4-44a18138f66d@linux.intel.com>
Date: Wed, 23 Oct 2019 11:00:43 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/4]_pinctrl:_aspeed-g6:_Fix_LPC/eSPI?=
 =?UTF-8?Q?_mux_configuration?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 23 Oct 2019, at 05:42, Jae Hyun Yoo wrote:
> On 10/22/2019 11:34 AM, Jae Hyun Yoo wrote:
> > Hi Andrew,
> >=20
> > On 10/21/2019 9:47 PM, Andrew Jeffery wrote:
> >> Early revisions of the AST2600 datasheet are conflicted about the s=
tate
> >> of the LPC/eSPI strapping bit (SCU510[6]). Conversations with ASPEE=
D
> >> determined that the reference pinmux configuration tables were in e=
rror
> >> and the SCU documentation contained the correct configuration. Upda=
te
> >> the driver to reflect the state described in the SCU documentation.=

> >>
> >> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")=

> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >> =C2=A0 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 56 ++++++++++--=
----------
> >> =C2=A0 1 file changed, 24 insertions(+), 32 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c=20
> >> b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> >> index eb0c11a9fbf2..fb96e8d2e6c8 100644
> >> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> >> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> >> @@ -1098,61 +1098,53 @@ SSSF_PIN_DECL(AD15, GPIOV6, LPCPME,=20
> >> SIG_DESC_SET(SCU434, 14));
> >> =C2=A0 SSSF_PIN_DECL(AF15, GPIOV7, LPCSMI, SIG_DESC_SET(SCU434, 15)=
);
> >> =C2=A0 #define AB7 176
> >> -SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU434, 16),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AB7, LAD0, LPC, SIG_DESC_SET(SCU510, 6),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 16));
> >> +SIG_EXPR_LIST_DECL_SESG(AB7, ESPID0, ESPI, SIG_DESC_SET(SCU434, 16=
));
> >> =C2=A0 PIN_DECL_2(AB7, GPIOW0, LAD0, ESPID0);
> >> =C2=A0 #define AB8 177
> >> -SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU434, 17),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AB8, LAD1, LPC, SIG_DESC_SET(SCU510, 6),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 17));
> >> +SIG_EXPR_LIST_DECL_SESG(AB8, ESPID1, ESPI, SIG_DESC_SET(SCU434, 17=
));
> >> =C2=A0 PIN_DECL_2(AB8, GPIOW1, LAD1, ESPID1);
> >> =C2=A0 #define AC8 178
> >> -SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU434, 18),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AC8, LAD2, LPC, SIG_DESC_SET(SCU510, 6),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 18));
> >> +SIG_EXPR_LIST_DECL_SESG(AC8, ESPID2, ESPI, SIG_DESC_SET(SCU434, 18=
));
> >> =C2=A0 PIN_DECL_2(AC8, GPIOW2, LAD2, ESPID2);
> >> =C2=A0 #define AC7 179
> >> -SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU434, 19),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AC7, LAD3, LPC, SIG_DESC_SET(SCU510, 6),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 19));
> >> +SIG_EXPR_LIST_DECL_SESG(AC7, ESPID3, ESPI, SIG_DESC_SET(SCU434, 19=
));
> >> =C2=A0 PIN_DECL_2(AC7, GPIOW3, LAD3, ESPID3);
> >> =C2=A0 #define AE7 180
> >> -SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU434, 20),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AE7, LCLK, LPC, SIG_DESC_SET(SCU510, 6),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 20));
> >> +SIG_EXPR_LIST_DECL_SESG(AE7, ESPICK, ESPI, SIG_DESC_SET(SCU434, 20=
));
> >> =C2=A0 PIN_DECL_2(AE7, GPIOW4, LCLK, ESPICK);
> >> =C2=A0 #define AF7 181
> >> -SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU434, 21)=
,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AF7, LFRAME, LPC, SIG_DESC_SET(SCU510, 6),=

> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 21));
> >> +SIG_EXPR_LIST_DECL_SESG(AF7, ESPICS, ESPI, SIG_DESC_SET(SCU434, 21=
));
> >> =C2=A0 PIN_DECL_2(AF7, GPIOW5, LFRAME, ESPICS);
> >> =C2=A0 #define AD7 182
> >> -SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU434, 22=
),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434=
, 22),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AD7, LSIRQ, LSIRQ, SIG_DESC_SET(SCU510, 6)=
,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 22));
> >> +SIG_EXPR_LIST_DECL_SESG(AD7, ESPIALT, ESPIALT, SIG_DESC_SET(SCU434=
,=20
> >> 22));
> >> =C2=A0 PIN_DECL_2(AD7, GPIOW6, LSIRQ, ESPIALT);
> >> =C2=A0 FUNC_GROUP_DECL(LSIRQ, AD7);
> >> =C2=A0 FUNC_GROUP_DECL(ESPIALT, AD7);
> >> =C2=A0 #define AD8 183
> >> -SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU434, 23)=
,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_CLEAR(SCU510, 6));
> >> -SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 2=
3),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 SIG_DESC_SET(SCU510, 6));
> >> +SIG_EXPR_LIST_DECL_SESG(AD8, LPCRST, LPC, SIG_DESC_SET(SCU510, 6),=

> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 SIG_DESC_SET(SCU434, 23));
> >> +SIG_EXPR_LIST_DECL_SESG(AD8, ESPIRST, ESPI, SIG_DESC_SET(SCU434, 2=
3));
> >> =C2=A0 PIN_DECL_2(AD8, GPIOW7, LPCRST, ESPIRST);
> >> =C2=A0 FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD8);
> >=20
> > Does it need AD7 too in this group?
> >=20
> > I think it should be:
> > FUNC_GROUP_DECL(LPC, AB7, AB8, AC8, AC7, AE7, AF7, AD7, AD8);
> > FUNC_GROUP_DECL(ESPI, AB7, AB8, AC8, AC7, AE7, AF7, AD7, AD8);
>=20
> Ah, I realized that there are seperate group definitions for LSIRQ and=

> ESPIALT. Ignore my comment.

Yeah, I grouped them based on required/optional signals in the LPC/eSPI =
specs.

I suspect we'll always want to mux e.g. LSIRQ if we're using LPC, but wh=
o knows.
I'm trying not to constrain what lines can be used for GPIO where possib=
le.

Thanks for taking a look :)

Andrew
