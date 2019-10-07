Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112DCE497
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 16:04:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n2Jw0JMVzDqNb
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 01:04:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YLvGx/Ro"; 
 dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n2J21xzczDqMK
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 01:03:13 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id t84so11704431oih.10
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VNlfbvPGFalt53w0SJTVXxAZYSzVXk8pIAnmC8fhLBw=;
 b=YLvGx/RotOJBTMnZFV/C4JYqnQjVeECs1k8EfwtdMZ0MX8Ba6dkqBKrAKnIF/9CGVd
 /B3bkTS9K4vBQIY0Bt9szIbjvbjCRxDO4w4ruIkUrfZX2nDvwlXRm0MwczCOcSUYPKgy
 AN28QmccTlEooW0fqN9wgsprHRSpFalC0Oy7lKf2iLsF5BWOfUuEBCWiWD5e0f/oBRAR
 oGKaMsNbIzhxseYugC944lJiiDpUpChI0raIPtZjorVUce5PF/gW9lIOerh0CFrpanGK
 WOf3XtdLl5oEarc8cA9s3DiDrgOWNpq/HsbrEHYZy9DmVoDJ2AIhFRyIGY3Opej2Es3F
 wGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VNlfbvPGFalt53w0SJTVXxAZYSzVXk8pIAnmC8fhLBw=;
 b=a/Um+A36Hir97lCbB3unNawh9YHg3Wu7KicA+31S7vhYeck4LvRI2yczSE/JrCy6gH
 8DIs6mFS6yTqtk5SkUNE5yzxhieok38vr3a6bUSX2C/+xcPl1WTH8JGiNIoLoBFj/0Sw
 sl6ifQJk9zX7Wy2z/349NUlNtwCIF8BA7uFHrJeIFe8Tbrka269VNWamvYYpKAO0eeCM
 tpY43UnqHLAtoGAVQfXNKAdpnno2jl+4uAWGh+ot0UVi80ra3hc8PSVdm5YqqDy32/F6
 dBu3vI3IFEOHDnBGkCW3pmAl2rbL3/7jnJjovIcCtA+21fWoUCrTfFhPa2/UJEj5wB99
 ETNw==
X-Gm-Message-State: APjAAAWZW1h07wQaRTmSECJ/5EOpeALJ25AO/sqA4WtSYDlDz61jR4ny
 hFwjomWtbfl1lftctu2A9EDaX443
X-Google-Smtp-Source: APXvYqyKpkMmLR1lNUjjIV474qLYTWnWNvG72aZ4P/6c8/gpMwLy8KqCySO3bitQoRNRf7/yHTNomg==
X-Received: by 2002:aca:598b:: with SMTP id
 n133mr18655134oib.170.1570456989301; 
 Mon, 07 Oct 2019 07:03:09 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f12sm4154571oij.1.2019.10.07.07.03.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:03:08 -0700 (PDT)
Subject: Re: FW: CCLA for OpenBMC project
To: "Saravana Prabhu G. - ERS, HCLTech" <gsprabhu@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <6F477727-573A-4666-A14A-1B6CB1E04E88@hcl.com>
 <B30BEA07-05F3-42B5-9620-04917131A5C7@hcl.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5eabe6b9-ce5b-da21-426d-e94594319cd6@gmail.com>
Date: Mon, 7 Oct 2019 09:03:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <B30BEA07-05F3-42B5-9620-04917131A5C7@hcl.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/1/19 5:46 PM, Saravana Prabhu G. - ERS, HCLTech wrote:
> Hi Team,
> 
> My company “HCL Technologies Ltd.” is planning to contribute to OpenBMC 
> project.
> 
> Towards that the CCLA agreement attached is signed and the same is 
> attached herewith.
> 
> Regards,
> 
> GSP

Welcome! Thanks for signing. Your CCLA has been accepted.

Kurt Taylor (krtaylor)


> *From: *"Saravana Prabhu G. - ERS, HCLTech" <gsprabhu@hcl.com>
> *Date: *Friday, September 27, 2019 at 11:29 AM
> *To: *"manager@lfprojects.org" <manager@lfprojects.org>
> *Cc: *"Dhanapal Subramaniam, ERS,HCLTech" <dhanapals@hcl.com>
> *Subject: *CCLA for OpenBMC project
> 
> Hello,
> 
> Please find attached the signed CCLA for your reference.
> 
> Kindly acknowledge the receipt of the agreement and let us know if you 
> have any questions.
> 
> Regards,
> 
> GSP
> 
> Efficient Time Management? “Eliminate – Automate – Delegate – DIY”
> 
> ::DISCLAIMER::
> ------------------------------------------------------------------------
> The contents of this e-mail and any attachment(s) are confidential and 
> intended for the named recipient(s) only. E-mail transmission is not 
> guaranteed to be secure or error-free as information could be 
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or 
> may contain viruses in transmission. The e mail and its contents (with 
> or without referred errors) shall therefore not attach any liability on 
> the originator or HCL or its affiliates. Views or opinions, if any, 
> presented in this email are solely those of the author and may not 
> necessarily reflect the views or opinions of HCL or its affiliates. Any 
> form of reproduction, dissemination, copying, disclosure, modification, 
> distribution and / or publication of this message without the prior 
> written consent of authorized representative of HCL is strictly 
> prohibited. If you have received this email in error please delete it 
> and notify the sender immediately. Before opening any email and/or 
> attachments, please check them for viruses and other defects.
> ------------------------------------------------------------------------

