Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031286A6A2
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 03:37:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=e1E0+EV6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkz6F4Q33z3cZD
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 13:37:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=e1E0+EV6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=deller@gmx.de; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkp9q1vk1z3bsT
	for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 06:55:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1709063649; x=1709668449; i=deller@gmx.de;
	bh=qABnCit5KPAiHr/Kp/IS0mrnJofA1cCmJBn+3gjrR+Q=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=e1E0+EV6cUARqjkZLOR7vyHMPZmHfvv/v9iuGO3g7eA74YM4BAvrQoeULtIXjtol
	 w28+cNglFaeRqU3k/Yt/12BxTTZAJx/IEjOKfpmIoU8uis3lRKzHKMUHpboXWqdPx
	 I+KYoRuKtvaZbl7N9LS+z5CJuwK2DVqXECZpsY3/AJOD5wMr0MZKBQuFr9tjxj8R6
	 ikQPugrrJyvVbAMgQePl4QstARrSxIOZpq3sMlMP+HLVwFDkQv1x7VxME0mmlYO9v
	 emde3QWNDL5YviMPoq4M1XqqW9rq22W59NIfkSbeCC54IyeM5RRIT4q/jZCvhcB2K
	 YbMBNoDMEO5YFVmiVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.157.76]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mk0Ne-1rCYGH2jSy-00kOct; Tue, 27
 Feb 2024 20:54:09 +0100
Message-ID: <e391cad0-7b98-4efd-bea1-cf5ab9c626bf@gmx.de>
Date: Tue, 27 Feb 2024 20:53:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] prctl: Generalize PR_SET_MDWE support check to
 be per-arch
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Zev Weiss <zev@bewilderbeest.net>
References: <20240227013546.15769-4-zev@bewilderbeest.net>
 <20240227013546.15769-5-zev@bewilderbeest.net>
 <Zd24aCps4xD28c74@shell.armlinux.org.uk>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <Zd24aCps4xD28c74@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tw+ae2K+8HdN97zn0nU9mcLGLIbOqP1QiharSdPPjQBUObrxIMx
 EoAooahMNQ/jRMZvOYpqWMFZVD2Y+b0KqJO2OnK/OLp9Z3nsS3YfE4uvFb2DWZF7TkEveOx
 6xy9KMtuxgqXp+7FWV+YOHTAcKpKiL1kx0/B7R4KOKyEI42N4ipny/nCn7m7LoMX/b9U427
 yJWqz1prVRj1xfL4N3ipQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:agvPXLbsPcQ=;Nm4RFtKAvlwmH5rZU7YwIbOg/vD
 OUtTO7T05yGYGFjg036cUc39NdnAyE9cAdO6BBLS7ztuPGajfMBAuFcMPop+kauTeLgrCVt9I
 pVNftXBdEoqTX+9kaC2Ly+MxU1xV6rYL5a2tW5A7ZpQrkbM34Ofq+RSBxpBowf/Q9wFhMJWpl
 o8Q1olzUXJQ3W+pqj4M7iAhpZLI5uQAWAIyt5tLNaQLGLc/qUNzIkWKMLLsU3RIQjhN9c0i10
 zO37V7thHtJflRDtZ3cSWqkei1XpnIGMW4OrBzTr0TdvtxO1PzSN05+Rw5cuW5imV93srBWJj
 vAXEZjYsam6q7BR8QB3IgstOnSo9FNSB9UaELj+epg1/Eako1UzWAHFc/d2ELs3iA+djaooUX
 kFH8M4/sWJo/kiICRYVRekXGsj+vWZ1U4KyLuQz/0lEzHdCjoJFTBjRjsSwTOjF1uq5sogmSC
 xkgwGVScd6JZmy5sMPzhXYG/QaqwjpxADWhEHYS7pfqtAzxIV685unv5GYKu6jdcO3LF+VDXa
 YLEUcGIeo4MLhmDrUuRtO26krxMqtV4YpMhiTLUnzPgqJxzzA7kmxJDBbISLK6Wb3nAb5IcxH
 7aqDlewBDqfM9tpKWHb4uz/oqmhv1hYjr9vd4w+GIOYZqp+AZ78NqUO4FgY237f3RF4LnlMdg
 KHsTVwVoc7z5uQxOFMngM8g3iG6QxsaHgjHSZsMm3OqhIQrRLy6E2Zv5L/QBfqZ8Env3b1Cl0
 NDsbyVPV2m3WNZoxFqZfr8aPJ0G/HA7ziF2f53b9RP8N4Qivtfj5mUk/CuJKG1s3qbkIN69xQ
 jTurXi/dcxVWgFweh+9fobRuumiJYzEADTtwfrf2dd4rs=
X-Mailman-Approved-At: Wed, 28 Feb 2024 13:28:58 +1100
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
Cc: Florent Revest <revest@chromium.org>, Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, Kees Cook <keescook@chromium.org>, linux-parisc@vger.kernel.org, David Hildenbrand <david@redhat.com>, Josh Triplett <josh@joshtriplett.org>, openbmc@lists.ozlabs.org, Stefan Roesch <shr@devkernel.io>, linux-kernel@vger.kernel.org, Yin Fengwei <fengwei.yin@intel.com>, stable@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-arm-kernel@lists.infradead.org, Yang Shi <yang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/27/24 11:24, Russell King (Oracle) wrote:
> On Mon, Feb 26, 2024 at 05:35:41PM -0800, Zev Weiss wrote:
>> There exist systems other than PARISC where MDWE may not be feasible
>> to support; rather than cluttering up the generic code with additional
>> arch-specific logic let's add a generic function for checking MDWE
>> support and allow each arch to override it as needed.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> Cc: <stable@vger.kernel.org> # v6.3+
>
> PA-RISC folk need to ack/review-by this patch.

I'm fine with patch 1/2:
Acked-by: Helge Deller <deller@gmx.de> # parisc

> Alternatively, it needs
> to be restructured to add the arch_memory_deny_write_exec_supported()
> override without touching the PA-RISC code, which then makes the Arm
> patch independent of the status of the PA-RISC patch. That will allow
> the Arm issue to be solved even if an ack is not forthcoming for the
> PA-RISC parts.
>> Alternatively, I wonder whether akpm would be willing to pick up this
> patch set as-is.

I have no preference, but I think both patches should be pushed
together via arm tree or akpm.

Helge
