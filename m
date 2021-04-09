Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9AE3595B5
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 08:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGpVX03Y7z3bpw
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 16:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=Gk4j3uMT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Tw9967rX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=Gk4j3uMT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Tw9967rX; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGpVH5njjz2yjS
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 16:43:02 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3ED7F5C00F9
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 02:43:00 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Apr 2021 02:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=AjC8pw7fMOJWA9P8AKFzMp8rQbLmptN
 /5rsRRZ3T9e4=; b=Gk4j3uMTuG7PW4rAOkhgwwRDVzHsUibd1AjYaSdF6esDxqi
 fmbN/Wj2P5dijDIOFBgtLIv1OFM8KMQ+eT81RYL5BR7tj3JZJoJ/CB8xgD6/Kxfv
 L7htGaH9ZhjsbcCgrd7bwaOs9drCkNQgaZT0iPfB2jxyspL2tY9acQ8OqU+FcCGq
 jgjEY72UERjcbh6PmF4mocqoBiUOgHTbSZhhQmHjIVnhmM1dUBZo4kZaIFgHtBo+
 34LQd88qSkVvjiwXdPRXeFeCHYS4VdwI9RPkAIU1HmpGbQbX3V0WbVQKSW+0WgCE
 NUmvixwjLpuQABezzUm0z0Beam6Ej1TK85LS5EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AjC8pw
 7fMOJWA9P8AKFzMp8rQbLmptN/5rsRRZ3T9e4=; b=Tw9967rX+ayEL/5Wox/K0X
 xzp0+vHG88kMUu39oa/IU8C04lVz2GrOkMwzZN+J0nZ8UiW+YORlvco0m/PpO5GW
 Q69NpAx1JSEcPGv7Lx5U1I3dTjcDy856CJPigclQoMHkVtwmJfF2Eei4b+TKUMiY
 W4385e0Jdku2DWHitkLugdJknP/vD3Utsyt7fJhyMtuKByD4EkaX83qU/xguC2hd
 ji8iTH6eZafL8hitX1Kuv0Lrau0kHzFX3bihj0PsbHN5njlbmbME6cifz08kJ9XT
 uTytfmD9/zernWdaYWOI4tOuxGvFjE70+N9sH50IGCeLdDWD/AF+NrFxUzUNh7QA
 ==
X-ME-Sender: <xms:c_dvYIDhlHylT1a0hLwLLP7FiD-7aBm_FZbR_2X0tSS79-RC6tricw>
 <xme:c_dvYKgf8_c8jRYaa48IyXA5vqn01BwqDduGBUa5T3mIGm71ZyJmEJBKCt9UqTKoH
 si1xQMjNxbxjr2tXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepuddttdekueeggedvtddtue
 ekiedutdfguedutdefieeuteefieelteetvddthfeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:c_dvYLnCNdfQlk5YTY8bo2bGGkrVacdvFF098MZwV5-WNXu9nZmH6g>
 <xmx:c_dvYOyKRSQ1ST6HbWCfUlOjMllwUmzTt5HsGkYHe-c98Wgi4P1Xzg>
 <xmx:c_dvYNTyP-Lg1xJrAGe5BsEqaPEvNq8zsGN6J-YLe0Z4bYWaxsq1EQ>
 <xmx:dPdvYEf8Dyuf8GwAHCs87ZA8Qhywzh1-LQX5v0s1gtEbs0LxRNHFng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AD1D0A0007C; Fri,  9 Apr 2021 02:42:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <f2f05ab5-5403-462c-807b-369251cc6b17@www.fastmail.com>
In-Reply-To: <YG/g/poZLwO34QH7@packtop>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-15-andrew@aj.id.au> <YG/g/poZLwO34QH7@packtop>
Date: Fri, 09 Apr 2021 16:12:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_v2_15/21]_ipmi:_kcs=5Fbmc:_Don't_enforce_single-ope?=
 =?UTF-8?Q?n_policy_in_the_kernel?=
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 9 Apr 2021, at 14:37, Zev Weiss wrote:
> On Fri, Mar 19, 2021 at 01:27:46AM CDT, Andrew Jeffery wrote:
> >Soon it will be possible for one KCS device to have multiple associated
> >chardevs exposed to userspace (for IPMI and raw-style access). However,
> >don't prevent userspace from:
> >
> >1. Opening more than one chardev at a time, or
> >2. Opening the same chardev more than once.
> >
> >System behaviour is undefined for both classes of multiple access, so
> >userspace must manage itself accordingly.
> >
> >The implementation delivers IBF and OBF events to the first chardev
> >client to associate with the KCS device. An open on a related chardev
> >cannot associate its client with the KCS device and so will not
> >receive notification of events. However, any fd on any chardev may race
> >their accesses to the data and status registers.
> >
> >Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >---
> > drivers/char/ipmi/kcs_bmc.c         | 34 ++++++++++-------------------
> > drivers/char/ipmi/kcs_bmc_aspeed.c  |  3 +--
> > drivers/char/ipmi/kcs_bmc_npcm7xx.c |  3 +--
> > 3 files changed, 14 insertions(+), 26 deletions(-)
> >
> >diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> >index 05bbb72418b2..2fafa9541934 100644
> >--- a/drivers/char/ipmi/kcs_bmc.c
> >+++ b/drivers/char/ipmi/kcs_bmc.c
> >@@ -55,24 +55,12 @@ EXPORT_SYMBOL(kcs_bmc_update_status);
> > int kcs_bmc_handle_event(struct kcs_bmc_device *kcs_bmc)
> > {
> > 	struct kcs_bmc_client *client;
> >-	int rc;
> >+	int rc = KCS_BMC_EVENT_NONE;
> >
> > 	spin_lock(&kcs_bmc->lock);
> > 	client = kcs_bmc->client;
> >-	if (client) {
> >+	if (!WARN_ON_ONCE(!client))
> > 		rc = client->ops->event(client);
> 
> The double-negation split by a macro seems a bit confusing to me
> readability-wise;

I did a poll internally about that and I didn't get any complaints :D

> could we simplify to something like
> 
> 	if (client)
> 		rc = client->ops->event(client);
> 	else
> 		WARN_ONCE();
> 
> ?

I guess.

> 
> >-	} else {
> >-		u8 status;
> >-
> >-		status = kcs_bmc_read_status(kcs_bmc);
> >-		if (status & KCS_BMC_STR_IBF) {
> >-			/* Ack the event by reading the data */
> >-			kcs_bmc_read_data(kcs_bmc);
> >-			rc = KCS_BMC_EVENT_HANDLED;
> >-		} else {
> >-			rc = KCS_BMC_EVENT_NONE;
> >-		}
> >-	}
> > 	spin_unlock(&kcs_bmc->lock);
> >
> > 	return rc;
> >@@ -81,26 +69,28 @@ EXPORT_SYMBOL(kcs_bmc_handle_event);
> >
> > int kcs_bmc_enable_device(struct kcs_bmc_device *kcs_bmc, struct kcs_bmc_client *client)
> > {
> >-	int rc;
> >-
> > 	spin_lock_irq(&kcs_bmc->lock);
> >-	if (kcs_bmc->client) {
> >-		rc = -EBUSY;
> >-	} else {
> >+	if (!kcs_bmc->client) {
> >+		u8 mask = KCS_BMC_EVENT_TYPE_IBF;
> >+
> > 		kcs_bmc->client = client;
> >-		rc = 0;
> >+		kcs_bmc_update_event_mask(kcs_bmc, mask, mask);
> > 	}
> > 	spin_unlock_irq(&kcs_bmc->lock);
> >
> >-	return rc;
> >+	return 0;
> 
> Since this function appears to be infallible now, should it just return
> void?  (Might be more churn than it's worth...shrug.)

Yeah, I think I was being a little lazy here.

Cheers,

Andrew
