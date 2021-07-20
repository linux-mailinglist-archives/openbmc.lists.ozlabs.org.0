Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945F3CFEFE
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 18:14:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTkLG2q2zz3bbj
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 02:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Iyu5a6I9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Iyu5a6I9; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTkL12NKtz3076
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 02:14:00 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id r80so11288423oie.13
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=X+4enYZMJlHBFDJXVaXb4RYgTmZphe7X5eT5Llhne8A=;
 b=Iyu5a6I9N4mpkShSFsW981cuOuCvqHLozo/YEzrmcJs9SMlZXvYS8MrhH9+iJ//WF3
 Fd5ppuAP5ruhYD5T5+NB0O8Sd8Z76z9LKlbRGnJramwkYyZ+iigwHJo9VVGCugvpnbtz
 nGv+FSJu/zFqp4pg2SKZNdECGj8nEg0Wyn701By01EPi/gEuqKUafoo7khCvGBNYWvFs
 sCnZrWmSOrAosdats2UsvrTgd6dSbW9hO5xYhsKR/TVpP94RoOtLnik5z+ztmTmqhONR
 mBMHyPPdOxyc1TQ0R2DOkw4Z3YB/WME5HwnCpKXWoBi4MXk0+p5NZA++hv3gZXs2g/F+
 Oozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=X+4enYZMJlHBFDJXVaXb4RYgTmZphe7X5eT5Llhne8A=;
 b=O/5IAqW/7pUmiGlxv/hv/Gbn+KkMmbW7L+83uZic+5wvsMB7B6eEIDDvG2sGbUAo5U
 NLmFxvx+pc6U3OzQkDX2MIboumJmD2PmTt/BRZ0bzCE27fj9xFNaXh0J4KuH0WwESnF8
 KuRHVsD9ltzba45ycCES9D/rmE4V1hp/V0O70HsoILfs+PwgzA7vMnHp4JYdFlEIVSky
 c07LMtC/NQvkm+Ud62S/5ZZgbGXH/yvUWJTW3v6a8rdpDWx3pBaWMaeo7/SCbMjuQsNi
 Dn6+R7AeGbFJAFd/FMswNXthVB2vu/jQ0WEH1kSsyGge0bEuyyPtWEwucTTlYyAiD6hj
 OrLg==
X-Gm-Message-State: AOAM5334KrL1dPaB4xvGqvW8XGelF0M0PBg+X42PQf6HjdL5cn2TxWeP
 rRyl/r+2nk4E8CkUIndFU/Q2JxCnugIXkQ==
X-Google-Smtp-Source: ABdhPJxNeMeSu7blSnE6AAW2G8z83pdbS0mKqNX1PMoF+MWbqqH4GjdgOkQLOZ4TNDCo+z0wogquhw==
X-Received: by 2002:aca:ab16:: with SMTP id u22mr2873080oie.177.1626797636422; 
 Tue, 20 Jul 2021 09:13:56 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-104-102.res.spectrum.com.
 [72.182.104.102])
 by smtp.gmail.com with ESMTPSA id e29sm4430647oiy.53.2021.07.20.09.13.55
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 09:13:56 -0700 (PDT)
From: krtaylor <kurt.r.taylor@gmail.com>
Subject: My role as Community Manager
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <f6de1ac8-5842-f43d-c47e-14c05464cae1@gmail.com>
Date: Tue, 20 Jul 2021 11:13:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
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

FYI, I'm not sure who knows, but I have been on a part-time leave of 
absence working half days while I went back to college and completed my 
second degree. I am reaching the end of my time with IBM and therefore, 
with the duties as Community Manager for OpenBMC. I wouldn't mind 
continuing this role, but don't currently have plans to do so with 
another company.

I believe that I have all the responsibilities somewhat backfilled so 
there shouldn't be any impact to the project. Brad will of course still 
be able to handle CLA process and requests for legal/copyright/license 
assistance. The monthly metrics gatering will be done by Reed Frandsen, 
and the metric tools are available in my github repo. I have talked with 
him about my plans to enhance these metrics to present a more complete 
view of project contributions.

I also acted as an interface into the Linux Foundation, but Brad and the 
TSC have also been copied on those activities, including the discussions 
on using LF services for hosting gerrit, jenkins, email, better website, 
etc. I will also hand off the access to our simple wordpress account on 
OpenBMC.org to Brad.

I did not get to finish the CLA/Developer acl automation that I had 
planned, but the beginnings are in place. The idea was to get CLA 
Schedule A's in txt form so that they could be managed by the companies 
themselves via a simple gerrit push. Developers could then be 
programmatically added and removed from other testing/company 
lists/groups as needed for simplified project processes.

So, July 30th will "officially" be my last day with IBM and OpenBMC. You 
all know my email address, and of course I will continue to answer any 
requests for help as best as I can. Please contact me privately for any 
questions/comments on this transition.

If I don't get to chat with you individually, please know that I have 
enjoyed working with all of you. I wish you all continued success with 
OpenBMC.

Kurt Taylor (krtaylor)
