Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E1145A706
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 16:57:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz81C4rtjz2ypj
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 02:57:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F3h+p3rn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=F3h+p3rn; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz80s0xlNz2xrP;
 Wed, 24 Nov 2021 02:57:32 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id bj13so45515669oib.4;
 Tue, 23 Nov 2021 07:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tDjoMJkmiCcFGdF6dcsQYg0MFBwPTTirRRHoT1oey7I=;
 b=F3h+p3rna1hgJMQ2amlf+ALUT7PuPQRM7rEmRW/imm8BDqtBQG4JoRrF1V9Tp2glRr
 U6t2ggtR4Fd1uYVhJPkOcUlzqnqXKrWbB+KuE1uGOt6ipPpCtoFnXsSDxYHn/dNJP8ke
 Izpox4iI3wq74SQSV+G7LR4wENLrD2IO1ucM4UDLVCCLxB9HNCTPuRjYUszH2gS3UC6p
 brm92l3sf68lTFh/owt4zVPiq2WRxkLUw8znWRHa1MomnmnsL37iFOz4W2JeMSab+mLR
 SMION44E+YLOBc32dEBpDxambbnB3gqr/RToWcm0ywR0XNic2D2WXbHNc0B2CdxR5yo5
 PpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tDjoMJkmiCcFGdF6dcsQYg0MFBwPTTirRRHoT1oey7I=;
 b=SaPUJ3T3GQ+N5zbgk3iqkEm0kVJQph1WF1cPJvjQnirEoH+RXZVYnAXrcnwtiZuX7+
 ++TQkqrlR83bla807hoysDRAXvbTAImdnV6YzdEM30TS1YILVtZv0AKAuYeNHMXCpMR1
 IBmzZMmiSXb/OzQcKJZs69TGUUNYrQkJPVTOdLef6yWOMR6OSfbikqDOgwSe5mySI0s3
 zC4gh12DUQVWA/VA2Mzo0fDGc+i2eratnlatvErgtGsrQsRnatDevaTbI3w1+zlCUdho
 h3sUb2ZyTt0Xb/RlptKrQ0CKo7uNmxq7Sz6dAw4y4CbL0ADDPjbS7C9lx+W+8We08AEy
 GkFg==
X-Gm-Message-State: AOAM5318CXgmIaHd4PXKl+Rt/LFdZr1rabiIodGIh6nhn8xiCA9wc9xt
 PPUSW4lgO9kD+ebEl8roQMk=
X-Google-Smtp-Source: ABdhPJyJEZGrtc0xcH378fpDYmIhdU3TWk/zSgIRsI4w8vfi4DX4cvdmiQV1eRnHYGTf+mpBnhA89Q==
X-Received: by 2002:aca:acc4:: with SMTP id v187mr3446169oie.35.1637683049879; 
 Tue, 23 Nov 2021 07:57:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c3sm2721498oiw.8.2021.11.23.07.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 07:57:29 -0800 (PST)
Subject: Re: [PATCH v4 12/13] docs: hwmon: Document PECI drivers
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
 <20211123140706.2945700-13-iwona.winiarska@intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d9dd9352-54e4-9837-b818-4bd38353e477@roeck-us.net>
Date: Tue, 23 Nov 2021 07:57:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211123140706.2945700-13-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/23/21 6:07 AM, Iwona Winiarska wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Add documentation for peci-cputemp driver that provides DTS thermal
> readings for CPU packages and CPU cores, and peci-dimmtemp driver that
> provides Temperature Sensor on DIMM readings.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


Acked-by: Guenter Roeck <linux@roeck-us.net>
