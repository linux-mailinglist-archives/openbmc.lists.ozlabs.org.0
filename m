Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EC2168822
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:12:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PN0l4VxbzDqp5
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:12:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XqM34JOo; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PMyp1dtZzDqlp
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:10:41 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id g64so3107034otb.13
 for <openbmc@lists.ozlabs.org>; Fri, 21 Feb 2020 12:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X2jqUNDYNdEFt7xWFKWQW6mHg4zwdYmL2f4VJWcUgF4=;
 b=XqM34JOoJTDfzIdR3U6TJwtLDhkUAuCWdF74oh4QRocvDh9Dih9+i33sfxfn+wCdak
 zH2oaNGXLyb67ay0AkKqwt4Uct/nzV2L4h9eNDKCEkq9iGmZKU5FjiKxrSuwhKuqerdo
 Zb3ZrjZnhKeEcZij3p112Ko6WcdEfvzqIE1mkycxsYddEXXOXZa9104VJdpdSCuHSKhi
 d/vek3EALi+h9JUckihGqKNiXFIMvypo0MrxkDXCahZPGVbrfr8fpA9BTzHoR356jl0J
 vl2Nh6vSeThshot4dVA1htQUZu8hnxPsslKp+8mYF4lEKUQYGGGOuIxScaXwtGg+cK0k
 3jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X2jqUNDYNdEFt7xWFKWQW6mHg4zwdYmL2f4VJWcUgF4=;
 b=bHNCxwmMHKPBKs+uWUW6mUIXBTY1rlklXQBqJXcDaX1kmwjplfnLSfSDdGd1KNaAFv
 D/bmNIQFUvcSH+M/Fgp+yUT+UznXl2Y94Aa3BooZQrIGf1SSMrpF/7RWLN/YLx6RkOAr
 wUfvrHVLwzpyXEkcWsaWKA27ffhqDDFwQ0vd0cFsh8NOpQw2MXAGlnaGJuoiItESkLE1
 NauOAEapQuJiAEUOKlmpSukW6YbM1nQ873CJjBLOZGKh/osDTJhaxa8mQwIV0OkJMp1M
 FjdqiM4Bsk2sWwEHUWpR7JeDnpdtgNnk/KR7goleiivYip5zzKfC4HT82Kw8D1pyaIHn
 CKkA==
X-Gm-Message-State: APjAAAV1doSFE39x2QM7RLxUWFy5eSN6+N6P8YPBHZs2WCX9XsRNIeWQ
 VTwyAUypZqd7WMaLnX9bT9V9veJp
X-Google-Smtp-Source: APXvYqzQac8jVkdBQouw2gXpntUwWmnKBXsdx7fkeAEuXRtyNKih4N7e+EJndt5daSVF/sbm4vFkHA==
X-Received: by 2002:a9d:4c14:: with SMTP id l20mr29472167otf.125.1582315837038; 
 Fri, 21 Feb 2020 12:10:37 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id j13sm1224521oij.56.2020.02.21.12.10.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Feb 2020 12:10:36 -0800 (PST)
Subject: Re: sdbusplus commits missing CLA
To: Patrick Williams <patrick@stwcx.xyz>
References: <20200220203546.GF41328@patrickw3-mbp.dhcp.thefacebook.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <97f984a2-e975-c620-7fc3-e3b7defb75ea@gmail.com>
Date: Fri, 21 Feb 2020 14:10:35 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200220203546.GF41328@patrickw3-mbp.dhcp.thefacebook.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/20/20 2:35 PM, Patrick Williams wrote:
> Kurt,

(Not a lawyer)

> We have a few commits for the openbmc/sdbusplus repository that have
> been floating around in Gerrit since early 2018 and seem to be stuck in
> "missing CLA limbo".  It appears that there was some discussion on the
> CLA at one point but I don't know what happened to it.  I don't see a
> CLA from the Bosch company in the Google Doc folder.

I have not received a CLA from Bosch, or an ICLA from the developer(s) 
referenced.

> https://gerrit.openbmc-project.xyz/q/owner:mark.jonas%2540de.bosch.com
> 
> There was recently a request to revive this work because someone else is
> finding it useful (and we've had a feature request open for a long time
> on one of them as well).  What options do we, the maintainers, have in
> this situation?

We cannot accept/merge the code until resolved. If they cannot complete 
a ICLA/CCLA for this submission, it should be abandoned.

> I don't really want to blindly reimplement this feature since there was
> good work done here.  There appears to have been no plagiarism issues.
> Since the commits have a S-O-B by two people from the same company, it
> seems reasonable that they fully intended to contribute this work
> publicly.  I'm not looking to restart a "why do we have CLAs"

CLA's protect the company, individual and the project. We must have 
permission from the company that a developer they are employing has 
their permission to submit code to the project. If they don't care, that 
is what the ICLA is for.

Kurt Taylor (krtaylor)

> discussion, but it seems like we need some direction on what maintainers
> should do when there is a missing CLA.
> 

