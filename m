Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21677341E82
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 14:39:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F24kp0mVyz3bvF
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 00:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FVGlIEUP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c33;
 helo=mail-oo1-xc33.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FVGlIEUP; dkim-atps=neutral
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F24kb0C1Fz30D3
 for <openbmc@lists.ozlabs.org>; Sat, 20 Mar 2021 00:39:33 +1100 (AEDT)
Received: by mail-oo1-xc33.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so2311354ook.2
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zhYFaUONR83ENQLSzvEYyaURY5SlMPVv8U0qoL6e+Ec=;
 b=FVGlIEUPRcwSwIhdWvHFn/8LsEulFH3CzBF9cGgnOcmfRD/t3gE+so/9WCMwCFNvh1
 FJURObp50vRIvhZl/trksoQ7siZqciU+JbzQ3fLXFYzL6NSsmRFG33CqppOvTA8ZPBf3
 CzNkwhqwHCR2/iEyGi3J/ccWCeM49ozNAFrOeSIrOcrQLbKhIGLYyTdLyC7XrM+YY6YD
 ZACrYHJ8GArPB+tcOAhhKleNXCREYlU8MxHp+cqdaFz5PNW3Gd5zWtsj4Q/7VN9+vcls
 NGEt8hwrmsPAOPUn3e3oKCNI+ZUq5ztnZ0cqd+bZYreNvYzdeaDByoFb0V3bLgYkDNcN
 1Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhYFaUONR83ENQLSzvEYyaURY5SlMPVv8U0qoL6e+Ec=;
 b=mRp1VhVw4Cy0msaiEDFGFkj3j+LFky7v252DNs9kTLToAUiMm8A04vCWrvUvnpKxLy
 zOFWNtLcl5+3ha9kcQwjq/mc+HXRb6L3Zo8B1okKffPrQDOaQ68Iiv29RczpISkNmQY0
 k4xJAmOFfK1PQ6KBLJfEtIHCwXnjyDFfLGYxwI6Xfk6PKQAyKKqpZXBPt7bwzreX4izs
 /qX+l1GVVw3cHna7A+fGvJ7+V//3Wjo06ru2RnL3yNryJzjrmJUYKuptnym8HYxE64U/
 CigYU34gJtRH+13m8i82Mx6J2vCYB4Mjii1lcMkEeFmkU9gkU0Go53sCwst2t7QY+1Cs
 qHWg==
X-Gm-Message-State: AOAM530c77hxwbA82NKgxeLZmHyDT457mDBKy6eKRKVP+2G1JPdc3TXC
 g+TZXLGMoCYKv/AeJ6fZKrI3Plt18p5HWQ==
X-Google-Smtp-Source: ABdhPJyZZpBSDcJLMCCXoxVKMG+8d5M0juNpA/HU9TGNYdJhMn+Y8zpnSflY6r6oywVyHRsb+mVIcA==
X-Received: by 2002:a4a:a709:: with SMTP id g9mr1465482oom.89.1616161169144;
 Fri, 19 Mar 2021 06:39:29 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id s4sm1226830oic.3.2021.03.19.06.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:39:27 -0700 (PDT)
Subject: Re: Bosch Sicherheitssysteme GmbH CCLA
To: "Meisenecker Robert (BT/ETI-CS)" <Robert.Meisenecker@de.bosch.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <ab897f9a1daf4d7b900d64cf453aab69@de.bosch.com>
 <20210309213111.7puayatdyodbn7yg@thinkpad.fuzziesquirrel.com>
 <00bda121-233b-0736-e789-113b3dd775a5@gmail.com>
 <26afec00e58046b48b3b2a8390223d92@de.bosch.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <c39bb986-89b0-64f4-5965-3a7485590773@gmail.com>
Date: Fri, 19 Mar 2021 08:36:56 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <26afec00e58046b48b3b2a8390223d92@de.bosch.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/17/21 7:04 AM, Meisenecker Robert (BT/ETI-CS) wrote:
> Hi Kurt,
> 
> the pending contribution from Mark Jonas last year was actually the reason for submitting the CCLA.
> I.e. I am in contact with Mark and he will also be the contributor for future contributions.
> 
> Please find the updated CCLA in the attachment - I added the missing information about CLA Manager and Contributor.

Looks great, thanks for the update.

Kurt Taylor (krtaylor)

> 
> Mit freundlichen Grüßen / Best regards
> 
>   Robert Meisenecker
> 
> Building Technologies, Connectivity   Product Data Sercurity (BT/ETI-CS)
> Bosch Sicherheitssysteme GmbH | Postfach 11 11 | 85626 Grasbrunn | GERMANY | www.boschsecurity.com
> Tel. +49 89 6290-1689 | Telefax +49 89 6290-281689 | Robert.Meisenecker@de.bosch.com
> 
> Sitz: Stuttgart, Registergericht: Amtsgericht Stuttgart HRB 23118
> Aufsichtsratsvorsitzender: Christian Fischer; Geschäftsführung: Tanja Rückert, Andreas Bartz, Thomas Quante
> 
> 
> -----Original Message-----
> From: krtaylor <kurt.r.taylor@gmail.com>
> Sent: Donnerstag, 11. März 2021 18:35
> To: Brad Bishop <bradleyb@fuzziesquirrel.com>; Meisenecker Robert (BT/ETI-CS) <Robert.Meisenecker@de.bosch.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Bosch Sicherheitssysteme GmbH CCLA
> 
> On 3/9/21 3:31 PM, Brad Bishop wrote:
>> On Tue, Mar 02, 2021 at 12:23:21PM +0000, Meisenecker Robert
>> (BT/ETI-CS)
>> wrote:
>>> Dear OpenBMC team,
>>>
>>> just to make sure that our contribution request from 2021-02-11 did
>>> not get lost:
>>> please find our signed CCLA in the attachment.
> 
> Hi Robert, welcome!
> 
> I did not received email dated 2-11, but I had previously been working with Bosch to resolve a CCLA for pending contributions. Is this related to the email I sent about a year ago (Mark Jonas)?
> 
> If not, can you work with that team to resolve this? Maybe add them to your CCLA?
> 
> Also, your CCLA does not have any contributing developers (and CLA
> manager) listed on Schedule A. Please correct that at your earliest convenience.
> 
> Kurt Taylor (krtaylor)
> 
>> Hello Robert and Bosch.  It appears it did get lost - apologies for
>> that.  Your CCLA has been accepted - welcome Bosch!
>>
>> thx - brad
> 

