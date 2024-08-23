Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1679D95C3D4
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 05:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqmFv5rWNz30TP
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2024 13:46:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724384784;
	cv=none; b=l1gX4YOfs48xOmGSqGxU6QFN1GchLcocGgiV7Il4FxhYKRzRvAelgqzhpDGArMQNDV+hqonJafvwNzWn+ZsGbBAM8K6uu01LydGKsRU4uy6o9hAcEhD6CLSSHuFFps9qlxX+B2JUA1CreoKagI59PWscWiYOVEY+8+uDp/FSsKHRAfK3m8M4STBrHPX3Ps2Z7yh2KZHp5E9IG13I0W89KP5yaDm/Oe4DKF5QvEhGaCe5Z+wNwCyCGA1xGuL3KX82/EtsWTG+edeEISBQcjCqmcLiM5YPiJ+fReil+Z6J1RpDwr9kMl/AQi6mbOTcvJEN/sFLlhNzxbCF499CvEtOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724384784; c=relaxed/relaxed;
	bh=0J1jg/aDXBT/8B5Nm11Rnaf+HLGDiOqvuq3ny5wqbrg=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=AIDVj9lUw62Cqlu01e02RKfcSr4uO//qqNP+Xvso7H3D+oaiOWydvzpDHKUB+v6rf4mDFVY/qO/4nKxfmFGJBJ8aayzsBP3MsMfKvc1mctWgbfJsEjyQ0L0p9uJttRtCxINONf5S1GcQ2WPysAIPM4e19bvHc3xfKEOWiAVIgRiy3kFyPNQuXopS/t0MFd+ksPia6FMIsLfbfTuv5am2kFqN4QpG1DDC4GLpWLnD5m8ijDVsqFqjyXKIrK4BScOLbs7hNfcxBzaGHEyIlaagcuccufkB3LpcI9A9/U9Bm0Jmmv07goLih4sA5WvVnm8eAOfUIAWFpuE+EMG0PBczSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LITEk1Mn; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LITEk1Mn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqmFq41zmz2xfC
	for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2024 13:46:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724384778;
	bh=0J1jg/aDXBT/8B5Nm11Rnaf+HLGDiOqvuq3ny5wqbrg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LITEk1MnAHxBtTTCmxWTj5aoQmlGFA9tl3y0+jHU/trEV9/AVWnpI4FeFT0c0oYAh
	 yl8hoclozyk/v+8wSTawJi/RIwgeOoTw4LBxbdwmp3clipfpQvllEv4lqbWTp4x29V
	 Y+ukZkPEiMGeE4rEJ29YqBfqxC2dkaAsBMY3Pi9UCz561MWNrALzrlq3YojASYd5RB
	 weN8SdtSZUkpwDFc8DpecR8MmK0R56gCPIb8ajk3dfqwtJ0SVUNh2vrijUzANV148t
	 2221WCJGeryCQGDu0jq4zNESJEQKS8uexvJQLU7kOGalZjEZv/hTEO2JYtG2irA6j9
	 XhoL2GfChjW8A==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BF2064FDE;
	Fri, 23 Aug 2024 11:46:18 +0800 (AWST)
Message-ID: <0f43165af1a2e86bd36bd2efd37c1b9eb91689a7.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/1] hwmon: Add driver for Astera Labs
 PT5161L retimer
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 23 Aug 2024 13:16:15 +0930
In-Reply-To: <20240822094803.2849010-1-chou.cosmo@gmail.com>
References: <20240822094803.2849010-1-chou.cosmo@gmail.com>
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
Cc: cosmo.chou@quantatw.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Cosmo,

On Thu, 2024-08-22 at 17:48 +0800, Cosmo Chou wrote:
> This driver implements support for temperature monitoring of Astera Labs
> PT5161L series PCIe retimer chips.
>=20
> LINK: [v1] https://lore.kernel.org/all/20231205074723.3546295-1-chou.cosm=
o@gmail.com/

Thanks for the link. However, I have a few concerns as a result:

- Why have you only sent the one patch in this series? What about the
other two?

- Does what you've sent here address the feedback from Guenter? If not,
can you please continue to work upstream? I'd prefer to backport merged
patches unless there's some critical reason why we must apply something
immediately.

Andrew

