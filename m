Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29B1AD34D
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 01:35:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493Fw201F8zF0QW
	for <lists+openbmc@lfdr.de>; Fri, 17 Apr 2020 09:35:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e;
 helo=mail-io1-xd2e.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CZF8RcQP; dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493FvF5Ht9zDsFH
 for <openbmc@lists.ozlabs.org>; Fri, 17 Apr 2020 09:35:05 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id i3so307469ioo.13
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkL8H0V82Zd7N7SD6G3Sb7Tfm/IjxLpL/SK/1WZ/x/4=;
 b=CZF8RcQPts3vlU/SqdfliHhGzB6/IFN7pCrUTW8eu0PMIQx3AqOEsWAObd2UWw04Xd
 U7pJBnfQif0XE7s1Eo5bbCWE0FpDVwBXxHb6q3d2fkhHBjqdQ13ts/WnCxEbFrFPHi9b
 twNvb/Ei+dGDusYlmWG1cYEGw07he6j4TbmGprYerhlFLevamNQDEpaYmzXh+UfcyWrs
 8MFtj1qBxYduH2QCpvPG7BChJjh7rlLj4ZbmXKdiAJLvwIzo7B1pQHYMfPzm+lvOyGXS
 FwvVTmtOjaRVI36+6+vWG9V3j1vpa4khwusHjcNbpBGdpm0yrRo/tDgd5y0qq5Khnh/m
 pYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkL8H0V82Zd7N7SD6G3Sb7Tfm/IjxLpL/SK/1WZ/x/4=;
 b=tWMAEiwuu2K+/n1VIg+lpJnFErpQW+VYxf6X3LO5dY9LKXlKMnj6INVUZ1AwPlxHGk
 jEGK1cv4+zXPOQWqft7URWfvfRTn16lY1+nY0K1sO4v8Qcex/paLlR0baxh6pXZPY3bT
 Cf57eci7+F7vRz8g9V5uuRBl21H28vp+HIDwXDiLsGM8v6G2awALlr81Mq5ZRDcyPkZB
 ed1RUSKhOy0IbUdJryL1HVa297qzU7j0ZjObb3WFRQJnus2fUEPhWhera+GvYw9q6Q/1
 6KEJ0nonLLTQYBwrxUzLE81mBpYUcUI3l8hSzuyo7NNCSPRK6w9kVKy9rwFliAs8+TjZ
 WM6A==
X-Gm-Message-State: AGi0Pubm+iFYrogBL5JblwpqdyS/yfroxOZpvpoNk6efTO7LLAsNBOle
 PZGTdwnu/fdpaw/uE9o1kVAtmVPtsnj+FrNEE6V8oQ==
X-Google-Smtp-Source: APiQypJvZ+0I84rc3XqIbvhVlI2hhlp28beWnWhMC9nUXLrqrP5iNBW58uYhPpagtTzciQme4v5EIqO8POlGEDO1GOw=
X-Received: by 2002:a05:6638:62f:: with SMTP id
 h15mr755604jar.102.1587080101432; 
 Thu, 16 Apr 2020 16:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <0F332F74-FF51-4239-8B52-2EBA770AE6CC@fb.com>
 <8022481D-7C72-4A7B-AF9C-D144177B4C88@fb.com>
 <CH2PR21MB1510E11F9772C45D12EEA0F1C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <82E67AAA-1BD8-41D8-BE27-966F840236E2@fb.com>
 <CH2PR21MB1510AEF844D82AC9D897B902C8DB0@CH2PR21MB1510.namprd21.prod.outlook.com>
 <4770a42d-d012-4e95-9347-d5c287c2e288@www.fastmail.com>
 <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
In-Reply-To: <5CD00373-FD92-4E57-90C5-21FB8AD6DD25@fb.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 16 Apr 2020 16:34:25 -0700
Message-ID: <CADKL2t5r0tCSOLiwovjiqvbV8_oCdJSSnGcekWZkGQb7JFDZBg@mail.gmail.com>
Subject: Re: nvme sensors
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 16 Apr 2020 at 16:15, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Currently, dbus-sensors support reading NVME sensors via mctp only. It uses
> libmctp and some of smbus patch from Intel. It also uses slave mqueue mctp
> kernel driver which is not upstream.
>
> So currently it is not matured and fully upstreamed.
>
> James, how can we use this without mctp. I don't see any non mctp support like
> Sending direct smbus command, please advise if I missed it.

If you want to use NVME-MI without MCTP, this use case is supported by
phosphor-nvme. It makes direct SMBus calls.

>
> Regards
> -Vijay
>
>
