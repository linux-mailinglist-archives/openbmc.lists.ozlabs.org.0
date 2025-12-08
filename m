Return-Path: <openbmc+bounces-981-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87712CAE61B
	for <lists+openbmc@lfdr.de>; Tue, 09 Dec 2025 00:07:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQHgj3tV8z2yD5;
	Tue, 09 Dec 2025 10:07:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765181053;
	cv=none; b=QcrZs+pm/LNbWgJqoI1DUtAXCgQefrmFYhLhbnNnJ76XNYws40+UmERRB7TWL8EVVLMjccigq73Q6sDaxP7SDL8N+yzYXDiIa9qezbaOyLSZdWw1Zjx9R1r7NK/LB4wdob21QYpbZwThEdpMVKfL72IlwH6H5eYW5/QSiuwVO80sc1yZobxzFOwfp2fAKaKCQM2nqsHoWf4a5/7PuJkvjxGC2abXOTJ1BBZ/F4S2Kba3wc3y1bWmkbDHXcaQUj3dYYsDmBAVh17NPBZVs9LYGCOIn9ZzsMrCMnlXZ36Tv3ZG3ZJ4doUUO5BGbnNL8/T2MRKX1f4KbdeJrG1Gp9oURg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765181053; c=relaxed/relaxed;
	bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baDz1nwmNt6MX223K8CaxbXGjOejgrSsj81DOo9aumBmqXYFhvKyOMXQ7d7GZhowHXV0tsL8kZmVgS2tNFraIFcF0iWRwGmkLagGM4q8v9/UEXXtCYlQSN4JtegBW3EWA4lnBlWp/VvcCLP5WogO0dMg4R2A0OAnNZcyjY3UsoHLSSAu0POT7VYt+Npre9cQs+pu5Droyeg4KWy5T1xw5EiRebIPLoZ4DAvdY18a+NC6fzvvNy0TTvyCnBn6shJyU9jLEZqzxFS0jqypIh36i1/wBGbpzbn0+x002j7OvcZ8nNqKK8jXN+HNliIkBM+Sw7ff6WfWyzHVGMOk51pCyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HFraTrDq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=mazziesaccount@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HFraTrDq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=mazziesaccount@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPvdR1bwnz2yG2
	for <openbmc@lists.ozlabs.org>; Mon, 08 Dec 2025 19:04:09 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4071262e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 08 Dec 2025 00:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=HFraTrDq8Z6YnbpbbZA6kyBnUVhK/pZXnfl5pEaDYYaYbADHKd8/M30DyS0zYA9mxr
         yplYTGBgVQxIWTyTX6vspGrs0vds1weBdj2WT5xI+cmXf4PSPdNKeW7Bns2fkFcKDKEd
         R/oA5A6AOxALNJVrGiqWXTUVNKiMueld1Pl8296T/TiOAJUnq9QB++6rtzs4TXAabb4P
         dxcr4vgKr+pFB5p9Edv9uV6ZPAG1zvPP5kv7OMquHaooTqTpZnmh6HW8WAL760d0KNwI
         F12C+Gi8sZGR80VCqs1xFJQty50XB1AublRu6HssMvrtydsSQIzFEJeqHCswOaLtuxjp
         JyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=Mc7ELFZb8Tgq2heakE87VHJ9oCHKYkEdcNFYGblfuyIF85Ijig6TFMYJencAX8Ncd9
         QW5V6JXyrnlDQvVEofyta6MabLkUJu5o72MbJcW6QeOmx5VXbWaofpNu+40ilO24WcWK
         8NIzBU8IWcVCAXCNsP6SMMAqu/x8LWXU3isgc15anot4X09KiKpAFeNg9RZ1n3a90f11
         DQbQd1SeHwT05mt3kjLgGnA6y0rwuW/o4x3887xKm1g4sVPECtlZvcARs+3Iz12eDZYs
         X2BPrO/meo23oWBTXtA6AggNTNEvyqhRMQBNpTBPhXIjMl+iR2Ywui4XOaz0P/pIEeJt
         WQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcQKu0u84Rl2xqrP6XbXTZ6Owz6SJikhVnxjzfPbyXU9YD9c6FgawTrm/b9VKTk8PfyeFaNOer@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyX24nZnB0c7f17xOdeOkdDtSPjDkMLq2CijZbV2ChkbkKtHGJ
	HZ/JcFYLKc7xKGmpSSfOm2q2zbQm9vtv74UhuaGIIWDzi1rPrzKezggP
X-Gm-Gg: ASbGncsqHYfmuNx9bVrF+QCLdJHSr9GqkEF4XglxzQJkHewd+eYwAOdCOe/1q28RFQh
	hnYkikUuKdV44JqecZgUmP+pcgAxFSXywLwjOs+cxOfMFO8v+xB4J1rHl0ec9wl4PBO7aCMuukH
	K0HfonD8EDZJ3+vK2lzEVHVMzEeW5eNEcGx8ySa/CK4+g9giZFE5fipGFwtVMdnRcAPedfjw+Lg
	PoETP8nd/MtJw3l/TQZuGFAL0k0OSh+yGCX5CLtEfOgDLztLF65U3YT09ZVjEhrUZ+xjX/tQ8FS
	1S7w6m3ywiF1YumP6mx+FQ+jA6wfKZkm817UaEVs+rtqNZvXZ3Jud8rs5batFs6BCDkoNtDY3wF
	9iXczqJ1IIpDRqXbK9StL6b8IYKINL0fMNg2bRhWTZ1BuDd+QDgxCc5BMFxl4VqeVWmYhQmWOvE
	7R20ySL0/wmCPPJ086bvoCXqnAKmWyB5Os6iWrfhlza6R3drJ1gbP1N0SteQzaLI1zYqGIojlUl
	zLiJhs=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

