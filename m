Return-Path: <openbmc+bounces-1396-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAr/H+rYlmnSpQIAu9opvQ
	(envelope-from <openbmc+bounces-1396-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 10:33:30 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229A15D628
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 10:33:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGp8g6HQNz2xlj;
	Thu, 19 Feb 2026 20:33:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771493603;
	cv=none; b=ZwK9MZfFn1cBYamu1ee9f47QmQqnj1k0fbosLOhqm36dCiUFWeituidvOXxjewqc0kYMFNnvx3cmN+pRNNmZfDNEqeA2SEFIBLQB8nOsrLKLh4Pk1Ra/54+Fb1JOXDCJQidmgg55Xz64ZCs7OZTYaWM3xQSWaybILXZC9IXKSB8YoiOsoc4C8lfvmEJdUYtbk8sB0+9dhglBdFRPNqL8dg87kc7O6QQ1uVVVFZJizKvy0K5wjmiJpVbA+C6YObP8wOTz1qsPexW4namHyctelOIXPipVUrpEInJ7ug7VeGr1mlCcOAI1vOZdvTpdZjCvS3EDtvKWMSGLYQxjBHsYoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771493603; c=relaxed/relaxed;
	bh=eanbz8ZOmI8oIkzFzxSYzcSBMlWhPp4W4AnfOCersdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VgqCmECTYe3hSJwaoNmJUpNI8yoEDrbYNw+X2QDINcTmmAQGIEK5dbo3myuMnHWy6VzgTLzYtXTgoIhxeTsCzuiRqWUUQUbQGAsJ/+As9f+zjmiOozKtDyLZhMb+m8JbphR7HIb64PG6t9iUx8ekEmJhX3D0zb6CU47u0O6q7Yt2fFc/9k/M8FbApjyYFbed7KbJV5TjVkZYI5HFT5xw260KoVW0EdLG4FqC/oELko7j1D5d+FDR8stgwUfQK4UVT9dYtE2RRHiUANUp49EP+Y/Qf0Ph9AgMHekk/CJsrKZCwH2hMZYp2qPysyOQ9B0RQYHsnSOzr7RIDrQkXg1lQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Em9DhV3R; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Em9DhV3R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGp8f1Tz4z2xd6
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 20:33:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771493600;
	bh=eanbz8ZOmI8oIkzFzxSYzcSBMlWhPp4W4AnfOCersdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Em9DhV3R+xGjdNqFfRPeKn4dsAOiP/p4CsbUTMLJq2EqeejagOQUKKdnibIHHOVIE
	 v1Cskq71Zt5Rwv+W2FXBIm9ppRloXg3ZKs8DafNncBb/HUd30ZU/x/JGoG5bpuLF3Y
	 +pgyG51TAw1sVdm5BFpIoFCp1YOKBkbuxO/Ml1oMiISliAzHzwqsu/G4H4ECHfRYqN
	 DZJQNYWnmuZbwS1m5HVLnAodxuEnvusw7hQigp8J+55+YY7dd8oBPauvOVka8sbiSq
	 znvdqnVlvW+us9IOvlFdyBo3Z3GWAG8TVV3CwWkI6ttHt6EvLZRE6gkEwA0EKYL//f
	 pA4YNrfppEodQ==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 888786002C;
	Thu, 19 Feb 2026 17:33:19 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260218184800.2261674-1-tmaimon77@gmail.com>
References: <20260218184800.2261674-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v1] arm64: dts: nuvoton: drop unused syscon property
 from watchdog node
Message-Id: <177149359944.1672458.8861526376824379637.b4-ty@codeconstruct.com.au>
Date: Thu, 19 Feb 2026 20:03:19 +1030
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1396-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:openbmc@lists.ozlabs.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4229A15D628
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 20:48:00 +0200, Tomer Maimon wrote:
> The NPCM8XX DTSI currently includes a 'syscon' phandle in the watchdog
> node, but this property is not used by any upstream driver and is not
> documented in the NPCM watchdog binding. Since it was never reviewed and
> does not form part of the DT ABI, it can be safely removed.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


