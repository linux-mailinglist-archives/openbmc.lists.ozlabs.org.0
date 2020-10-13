Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F17328D006
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 16:17:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9d0p2jr3zDqcg
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 01:17:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rgpCO59S; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9cyf1sgxzDqY1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 01:15:35 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 32so122811otm.3
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pdxJqlkFG4bGbusJfimwY970bSfnYIe981BPHGlXFRo=;
 b=rgpCO59SvKv6h6akLb+fEs1HQ9wxD+rq9eM9oZPwlNAC6JUNRmGEdFIvdytH46UIgk
 XYTa0R+5EFDVCmUUkYrfNlwO7IwYeDZb0fGEeo5/jIVn1WVL6Cc/sTpdObOZq3PN5Znd
 hGmrlrCz681rfucl8Bh9squrVQTHS2/aFQYwnw4UwjeiarV+7I02MUkXHC3giGj9HrzH
 yEmBa/3FaK4zR7AyfzigqKmzNQDPUzcKsf1G1dELISEgAuM9i7fkm+jkazhndK0LXKkU
 VC2JjdN19Vsu9tCzKM5j8qXISA688qwWiG3rzSE8ItW4zgj6PWi+2gjdCb8hyVem8Hck
 5z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pdxJqlkFG4bGbusJfimwY970bSfnYIe981BPHGlXFRo=;
 b=jZy1y75wwEEorWCky8gW0+teq9N7GNSUKBs+qYHMJln1YCTvbiJ4sILVHEBq82XVlL
 KdhgC85iXXo1LErnmWoK7oHENVUQ0IcgnmmO6AhegAQV+g75tUyzwZzIoA0GY8+U9aAs
 inXTxzwjX25HbOtfRVZWM53/vU5DabhbSRWLp3l3uf1hr2/eURzwyJc4GF+pGdlN5Sy2
 1tTgQaDR1NzG6BpRWfxMMOfFMbwpinBPevtS6wOrI+2DASE9MANAw2b+dRuO6ws/khe6
 dRT/wFPAXYMw5rL5ENdSTTbpPxrpWxhZW2GhpId4SggbmY3YSy4cMi8Ircsl9EUjwUYK
 c1UA==
X-Gm-Message-State: AOAM5326tMDomUNxm8I0zweC/uc9hL4AGk6R6JPZ8RUl0xMeEPMPmg57
 WCw/PgDZC+yVOZOVanCOELw=
X-Google-Smtp-Source: ABdhPJx46Q5XkD4CBXzecaQRgKFHYnMYgSRc2wc6/wAZ277RHQb9mNUlMc0OUhqzJqlfOCfQboHCCw==
X-Received: by 2002:a9d:4813:: with SMTP id c19mr22162996otf.320.1602598529639; 
 Tue, 13 Oct 2020 07:15:29 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id b7sm2359161oic.36.2020.10.13.07.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 07:15:28 -0700 (PDT)
Subject: Fwd: Fwd: CCLA for Gagar.IN
References: <CALVHhedrNwVe=K0zyPQAnEgfyReSgx9BKsYMAseynHGOpx1iww@mail.gmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, fercerpav@gmail.com
From: krtaylor <kurt.r.taylor@gmail.com>
X-Forwarded-Message-Id: <CALVHhedrNwVe=K0zyPQAnEgfyReSgx9BKsYMAseynHGOpx1iww@mail.gmail.com>
Message-ID: <9f2abb92-b5c2-6045-12e5-4549f8e75416@gmail.com>
Date: Tue, 13 Oct 2020 09:15:28 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CALVHhedrNwVe=K0zyPQAnEgfyReSgx9BKsYMAseynHGOpx1iww@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Your CCLA has been accepted. Welcome Gagar.IN!

Kurt Taylor (krtaylor)


-------- Forwarded Message --------
Subject: 	Fwd: CCLA for Gagar.IN
Date: 	Tue, 13 Oct 2020 09:13:11 -0400
From: 	Mike Dolan <manager@lfprojects.org>
To: 	krtaylor <kurt.r.taylor@gmail.com>, Bradley W Bishop 
<bradleyb@us.ibm.com>



FYI on a new CCLA.


---------- Forwarded message ---------
From: *Paul Fertser* <fercerpav@gmail.com <mailto:fercerpav@gmail.com>>
Date: Fri, Oct 9, 2020 at 2:22 AM
Subject: CCLA for Gagar.IN
To: <manager@lfprojects.org <mailto:manager@lfprojects.org>>


Hello,

Please find attached a PDF with the signed CCLA.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com <mailto:fercerpav@gmail.com>
