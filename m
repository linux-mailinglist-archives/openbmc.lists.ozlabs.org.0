Return-Path: <openbmc+bounces-1342-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAUNCD2KimnxLgAAu9opvQ
	(envelope-from <openbmc+bounces-1342-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:30:37 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37219116004
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 02:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f93sj57qtz2xQ1;
	Tue, 10 Feb 2026 12:30:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770687033;
	cv=none; b=ZwxM0ipex3Ekvf3sh1YARMFdfLCE+Vx5zbi8JSXCOSFBDOXais0n2Q1AkCMZG0FBo5iAQVCbg78hnmqdsCSO30rMjYCXXF3luMS5Qq6y56PMDN8jwbsBGkdoDmKC3QZixecopaQWToPmO2L0qoxfaE/LJrQZCQwq6jsIXZ0o4/K7dssW4962xqcQEv712rJRYeCsxlCAz6CumC4nnFZD9TSBPOQo3KhZlUPpvZAwh/8/2citF7JOjpSepGEJ+FlLT5BNj0vrKUzkUwT7dIVQgRsIa+I7OZWURXh9nioHOD8mEPDDQk2JdFuLLGd95QKGME76p8nmWnB1R9AJnCjKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770687033; c=relaxed/relaxed;
	bh=Tdo0p9iBsMfTh7ALH7mex/M3S8aQYGr61IWEE+eNsMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDBiAgDMtJc9lBppiaUgCJ7YAisSoZ3jPdIcNINGqA8qbF+kLYL28OnhGJPjECi9LJsCVBvO4/BDwflxmaFyYVXYXfxEWuQNxxLVtOWOscQDOP3pGcpGp/3g9FSIjkdGEpAWolBY8Xck6K4ddC+oqurcAkniaX112uxbpgv1N1x9L3sErdlSV6u6caSi47FoJZtVBzjgYdlRED/eM0841oJksXb1tdyBHeqYLv7DTNC75KNDRklKLeYB1YyOfrLDUEXXK4MHMS4+y3UWTReI2NQ3Pe+3dyELTelPyfsMApoq22ka7DQVic7iUflylZY2Fw+j8yGv0/C/8/RhPg5kOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b17xXxT1; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b17xXxT1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f93sj0wTHz2xN5
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 12:30:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6119160137;
	Tue, 10 Feb 2026 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB022C116C6;
	Tue, 10 Feb 2026 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770687030;
	bh=Uo2Pfl6hyhMXQD3RE7rk1AAawAsayGOyRKqwMxrRElI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b17xXxT1qROJYRtlyi8CwFU78ehZFBEo28RsXAmTsu9gdxHALE9ZCjcX9ZE0RYhFW
	 F2vCeOHxWJc6XJcNQeBH4PcKnMc9/Og8gyYkTWb9rBTmo9CXytP7fQJwXnJTaXcOAp
	 vnwtVvqj5+R3U1YQ/4A9Ti9tHqIQI0wYkeAnCsGLNCTMEa449PT6MXaWdh1/HrXdeA
	 43wR/K90+CWDebSF03rDGdsltgK6Xgr5h6ElWRKdbB+g72Sr4yyLzayUxsmI9Q+dIk
	 DEGSMqafLv2cBjLTmNsIEn6VXcKm7ksdd7NKxBK1WQx99QaRerEZRiDsoPOhNKKA2x
	 8iFXDu70A/7vw==
Date: Mon, 9 Feb 2026 19:30:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzu-Hao Wei <twei@axiado.com>
Cc: openbmc@lists.ozlabs.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add
 Axiado eMMC PHY
Message-ID: <177068702757.2279882.2179431241227360532.robh@kernel.org>
References: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
 <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-1-a2f59e97a92d@axiado.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.30 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1342-lists,openbmc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:twei@axiado.com,m:openbmc@lists.ozlabs.org,m:conor+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:srinavmani@axiado.com,m:pbolisetty@axiado.com,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 37219116004
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 16:22:08 +0800, Tzu-Hao Wei wrote:
> From: SriNavmani A <srinavmani@axiado.com>
> 
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC host controller.
> 
> Signed-off-by: SriNavmani A <srinavmani@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> ---
>  .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


