Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11694599EEC
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 18:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8Rlt08p0z3dsG
	for <lists+openbmc@lfdr.de>; Sat, 20 Aug 2022 02:19:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=D6fnkq5n;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N1hg9b0E;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=D6fnkq5n;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N1hg9b0E;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8RlP1yhmz3cf9
	for <openbmc@lists.ozlabs.org>; Sat, 20 Aug 2022 02:18:56 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8A0E132007F9;
	Fri, 19 Aug 2022 12:18:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 19 Aug 2022 12:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660925931; x=1661012331; bh=6oMEs5QQrU
	eEo5uIL+Pxvifgye62PSWPs6A9eFaHhj0=; b=D6fnkq5nF0Hp/708CB0Ixypoe5
	yBC5Mm1GbIM05zm6Gad43PB9/8ICzuvzSCP+QdbSq9RV4gZMrSrnHmjG34/XE/dT
	RkB+50wjP2S3i052CCaH6iVCN/zTLGQ1uxWQJxaUbmcUqga57D7jF3Tzc6i1BHT6
	1F3v+u98GodFDJngULC+MoY6quOuaJH1wkVQl5nd+4bzI3QECSf+80Rdx5+MBnZS
	JlzPYxMCLvzNuXQDdFLHhxaKSvEigUQKUASdCtD5mtAOeWW34v/bZvf10rPW7zX+
	ULCQOKx5pAxRxVbLXcJ548ifuPa2Zay+4JbBw2ONV+goZ5GPAId77nvKkvuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660925931; x=1661012331; bh=6oMEs5QQrUeEo5uIL+Pxvifgye62
	PSWPs6A9eFaHhj0=; b=N1hg9b0EiKde3voJ+dFWkGpdtpk8NJ+uF+OOA2l/pQk9
	CYhuq2+zwff5VuLz+PBTbGrwddEK89C5PgKbwi3maJoX7y92fma6omjcbRP39guh
	chPev3UayVqB1T1nyan6A2vtZWHJ/pQrVyJyVxBzaexfe92xzCLrDcDjxpYbMr02
	lxebRqrvssRysZ/WSte0IBaNCg/+zPfVIstr0XpRRokd7bmuRUidjmTYSygKYPaL
	rXEliDEnWh+0e35jiOnNRCcCsGQoaofD+91gdwTdku6IwW9bV4L3RwbTtPx8hyoI
	nI34CMQOh0pZWDhJcmibVfcVGtiqRpLGDZ2SnS7eLw==
X-ME-Sender: <xms:6rf_Yvw8n-6T8q9FzSUfrJ1jAziWKYQxo8UUuBQCe32Fd1fL1JdPaQ>
    <xme:6rf_YnR73bKAUTLh0T8RXrtxTeNzHkluGwd4-NG5Ao72LwjTxy5ZE6nTM_TflB_eP
    hiiwLcEDOJRB0V7YAw>
X-ME-Received: <xmr:6rf_YpUgiIO-8OHyuQ1ICml2ksYIT43Ecw78Jwdz3M9NyGbRsJJxgvLrRTpAiq2pe2b_jfTkFnW5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
    feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:6rf_Ypgpe9LlD_3m-UCSZCi7Qs-9sJid_q2UlYq7SrgveGIapayQjw>
    <xmx:6rf_YhAKM6qIyMxlEpvS1XnFnVIbloGdnOjW5Pc1GBCVDZBYSmbKOQ>
    <xmx:6rf_YiJFbPruUbKJ_Zo9mDlRVCBoca1hiWlGPm4tEju2W3j_aQGmuQ>
    <xmx:67f_YkNJ78TDjwjWlsQSfmuLfE4q-U8213yiLvXEp-UwTFJBynSzUg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 12:18:49 -0400 (EDT)
Date: Fri, 19 Aug 2022 09:18:48 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Alexander Steffen <Alexander.Steffen@infineon.com>
Subject: Re: [PATCH 0/7] tpm: Pull tpm_tis_phy_ops and tpm_tis_i2c updates
Message-ID: <Yv+36LewgqZwIaAF@pdel-fedora-MJ0HJWH9>
References: <20220808220839.1006341-1-peter@pjd.dev>
 <fe96bfc2-9317-fb51-920b-6d041bc7c2f7@infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe96bfc2-9317-fb51-920b-6d041bc7c2f7@infineon.com>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 19, 2022 at 04:18:00PM +0200, Alexander Steffen wrote:
> Hi Peter,
> 
> sorry for the late response.

No problem! We unblocked our development on this issue by just disabling
the TPM I2C driver in our kernel config, so there's no particular rush
for us.

In fact, if Joel wants to just avoid figuring this out and merge the
5.19 kernel, that would probably be fine. But, that might still break
the machines he referenced, that are using an I2C TPM interface.

> 
> On 09.08.22 00:08, Peter Delevoryas wrote:
> > Alexander didn't include the compatible strings from the old driver,
> > even though it should be compatible, so I've included a patch at the end
> > which fixes that. I did it as a separate patch so that we maintain a
> > patch series closer to what the upstream will be.
> 
> There were some objections to add them and/or to document them in
> trivial-devices.yaml, so I left them out to get at least the driver code
> merged. Makes sense to add them back if they are already in use.

I see, thanks for explaining the context.

> 
> I still plan to clean up the TPM compatibles and their documentation, to
> make it easier to manage them in the future, and then also add back the
> missing compatibles.

Oh that would be great, thanks.

> 
> > cc'ing Alexander on this thread too to see if he has any suggestions, or
> > thinks I missed anything.
> 
> Looks good to me.
> 
> Alexander
