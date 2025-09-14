Return-Path: <openbmc+bounces-642-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D9B56DC7
	for <lists+openbmc@lfdr.de>; Mon, 15 Sep 2025 03:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQ6cs1Mfrz3cZ5;
	Mon, 15 Sep 2025 11:19:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757850993;
	cv=none; b=AZUxJ9BAzZQpwi7lKDxk4BmUPfdf+g/7owJLbd5EVyqoMTxuf1u3jVng3X9Xck32wRfRlDGJs5D9RDHYEOqaKwFfhRbVtoq9fNtlo/4tL9feKPubfE1DzrQwYXpi1vmuM7KE7+RWmvPsn8jj2LFSsmlQv+CjQnHulqKgiwF5DAAXCYStnNznOdAmuNl9FuAj+q8qrIoorZy1+ED+V3iA4dKvBbcC+mtyU0I4UPIB2nYZrujzZF8nDdwfCbe5LrgfMWbcmQ4scpa4Fw5ozMJduWiUXN+Npqgd763I8se2iqTgtWxs4iI64nVx1QFIx0JRbDIHGnzlsaCiJzZsCceG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757850993; c=relaxed/relaxed;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IyWwZIYwvT/2tTUOKud/aCeRgeDIX9PdbngdYfiROcizsmoUmKP+fXd9UC6VWY+XadsnW6g14eycg71hC3LXwdwEPjqcbjPXhq2q1qUPc+qDa6NxGu3+KPlaL+wzouyKunHAgay4gMaZf02c+Vf8SVlF4sf3CgZFx+ktNp2SUZ7PyV74IgGPld36+unhLDzW3PlPnl7yuepJzONJ1hmFjdfNxoajyQ8qg+h9L3JLSTFBFRoYRkY0GHQ5P6aHtwLGIpXA8Rl05f7dE6SKVUWpVkkxI3ND8r0EOAQi1Wd+v/6JEKmD3toPiHGb5S/b4LX46GfPhdGwltApYm4xt0y+2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IOevCH1U; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+XzAQwr; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IOevCH1U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+XzAQwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPmpm2f5bz3cgk
	for <openbmc@lists.ozlabs.org>; Sun, 14 Sep 2025 21:56:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
	b=IOevCH1U+udPzLC5GYXLuB6JSzGjrKzr6wFeUrPtwTIRjZrV6YiATbv4hVAM18bpln8EDA
	FMaHDazKr9/ukHqsU/698VliPuP7c46FpkXhM9gekBgAA3CFQzeHWS48OezirSrSEVuImf
	A1JgZevfKhq22eWiqRIcs79KZzDB7mI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
	b=V+XzAQwrq8K820rER+uaiksl6WFJy8YeU9mbosk1UBpYlgSNI0cfvtC3luwHdLm7dizQek
	ACGy67Z6QNgpgQX/d/5XSLUApuzhfgZu0+74mVeQBWkwFLvr42TCuo3VH/aI6X6iK0na8j
	flbLY2I+t3WzL21qETLcmQEWEcRLuvU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-wgzTH7JbMi24xRdVGxI-Zg-1; Sun, 14 Sep 2025 07:56:23 -0400
X-MC-Unique: wgzTH7JbMi24xRdVGxI-Zg-1
X-Mimecast-MFC-AGG-ID: wgzTH7JbMi24xRdVGxI-Zg_1757850983
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ff94e5c251so910564985a.1
        for <openbmc@lists.ozlabs.org>; Sun, 14 Sep 2025 04:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850983; x=1758455783;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7EEVogNqm3h2fGQuXoQvzBFJfVHtUlo6y8LaBgKxgU=;
        b=L/N6F6L5gQdKqW+Y1XnX/zvV6EzLO/RqOitc0JeDrSuCkeiq8vm8XeNcqzs6Seek/U
         YSxheYc+mwkSqyTkQojDUSdyWvJcLJMqeJgOfLN5OctnxxUQ23Z8XfQOfjRbq5BsGQvR
         7SK+XQramX+07JcPcCn742efrKO8tGPl37M/8KdiBQo7OLGkcjKGsk/h2GiVX5CJptgB
         rymkgSbsMMR5RfRRtoHzzTqdZHq/E3EcGrjUgeFCOh/hMCAaCKxtNQ7O6zb+ygXfBYiq
         1GlAX7TJNuChDLTghtkfpOCzd0X8S3fye8GlkAh0b/vjPzoNhU/KwVTIPNFjRYJCAgbi
         lVIA==
X-Forwarded-Encrypted: i=1; AJvYcCUJI+z0Oh+NpzgvtvIwy4fGZGjQFkN5GnAgM9/TaEfpyJGSSPGL35EloW1dv84NIxnyJCZpJmgI@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz71PR2tAcEoFVfAJOohifEu58brDU5mj3soOGDfj7BW7ClW5uH
	4xTEdsOlgrizQywGGu/2ppNd0QQtuSRL0olYs5P88CuyI8+ZPm9VOS7zasVbpaalpUdEhCsnfNq
	+VRK9CHNQn9geRI/E4wG9dBitITfYThwg6jC6DrmFstQG4sjiGGq06AZczL84
X-Gm-Gg: ASbGnctqJahR1mILhROLKtYY8ZHlbsmIJADGHFSVdX8WPNfw4lTDDXceuyLec73xGlF
	pVQmlCWHZOgiAF2kncjpNyTFjihevLMdOzufL/A/x8h+lAvEsN4gLK/PnaiO8NdlK++pO53uARt
	qU1EDtVHb4HhscxmiaD0GaFXdXn+qCA9IKRlP6gy8b7GqLr31bZtKvhr5HEYDUv6FZoSbMd5git
	evzwaoF6NZ7bRKQeyNbjaX2wOkye6jZmtJFVWpr2PM7rrNg1pjXleV7H4+2VI92x072rE+YCiFm
	qYoDvXd0Me/Pv1v9uYSKVGydZXRWwlgGuCmxLqkaq0kch8vjSxIlwPuluPv8K7Ta7WjtsS4y5Vs
	xl8CwjOiPd65wSgXTXZQ/DxBHRKgwViU=
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1625000185a.2.1757850982923;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjgXFxjwySPCU3ek1M0DJbAsGYTyjXrUec8xKOuYaZ+ALRKNikNG6Y3NJHY97G0hh6czoOhA==
X-Received: by 2002:a05:620a:414f:b0:7e8:8f35:1d2b with SMTP id af79cd13be357-81ff181374emr1624998885a.2.1757850982589;
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c974c848sm587652085a.23.2025.09.14.04.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:56:22 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:56:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aMatZAX6eFI1RmDH@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
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
In-Reply-To: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: latzgRt3HA40woMwIAckUD9Ni64ooGeeYLwK1qURji0_1757850983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Iwona, Joel, and Andrew,

On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


