Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21836050
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 17:28:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jt3M17hjzDqcS
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 01:28:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::331; helo=mail-ot1-x331.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KzdAFP2q"; 
 dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jt2V4g7GzDqWy
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 01:27:28 +1000 (AEST)
Received: by mail-ot1-x331.google.com with SMTP id d17so1090317oth.5
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zybTzQFdnrZgbx5cX+ONjOMMx/sMXhMegZYq20n9Mss=;
 b=KzdAFP2qy91+8++Vj2GPvEYKzKf8INFYernMTk16Znll74IXd9b4p0nVrGbbXLW9SG
 EWpg+c1dPb/ndO4adEQgvqxZ0a1o+NXgNxMj3jguDDazhK0dWgkwDOTY/PLX9YfEM405
 gPz/ddOaisJdqx8gFHFqZexVZ6JxXuholVbElyp+fOza5a1Tc6pU8OlGKC2Tqh2rqkcd
 +OuCQmputvyf1PoWs9rOU9u/i/0xNigSov6XdgQrt+VYrl6G+3XTzgDEy3hBbjRmqQ/z
 +TS75MH6ttV1wyXgU3qFBOAJ/KVYMfZzNJU5Bf+aL5Z8C9ifT5emkKqbmYIS5884pgk0
 nc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zybTzQFdnrZgbx5cX+ONjOMMx/sMXhMegZYq20n9Mss=;
 b=KuDe1YhcdwdkdemHWBb9Gez7ie58mOC99Wu4zkIB6lWR84bLcgi+p6lPXZCb2TfDBf
 uro3++fANtEHwNct/dpGlpoACRiaOwtAhsFMkM0ge27puiqhn/WVRlVXSS2vuJd+oZ1V
 wrJYOYv+ZtvE9oUXCTzF6GChDubOkLSDXKT2lv4yNmNwg2zPAOS9iWIqjABSOao5U9P/
 005nzRRMLgD9Y5WVNsfck5bvnb0Q5njTf5MiVZ5eFa6S0V9j9aGIOoHyQi6ONJhTQdsh
 2vy7GdAfXuwCGAAmucwnJjTmDzeHFFSHDE6G2BbtfvKyRkHouqEqt9LX+6vEnl3wXlXG
 IFkQ==
X-Gm-Message-State: APjAAAWdiGLKjcqTqJcTRKaFs2c77NSo4myJjIO5CZPuBFEQFBHBBcZp
 KScnKJwrA2DHEmH7+DzW+WyT98z3
X-Google-Smtp-Source: APXvYqxZ1bjmflA7K1JoTLEyj0FIX77W2nVM7+r61LV+547Eg98d6OuNLnnBQeIAVdEz17k7nn7dyw==
X-Received: by 2002:a9d:d23:: with SMTP id 32mr2179397oti.174.1559748443382;
 Wed, 05 Jun 2019 08:27:23 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id 93sm628645ota.77.2019.06.05.08.27.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 08:27:22 -0700 (PDT)
Subject: Re: U-Boot environment management from userspace
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Adriana Kobylak <anoo@linux.ibm.com>
References: <20190528183802.GH15959@mauery.jf.intel.com>
 <e42fb92effbc990f60239377b05e3f4e@linux.vnet.ibm.com>
 <20190530172004.GA46814@mauery.jf.intel.com>
 <8a52562d6237b1a6481d964f85718a8744e7a892.camel@fuzziesquirrel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <b1e41ae8-eb71-94a8-0c96-65fd46c8f245@gmail.com>
Date: Wed, 5 Jun 2019 10:27:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8a52562d6237b1a6481d964f85718a8744e7a892.camel@fuzziesquirrel.com>
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/5/19 7:35 AM, Brad Bishop wrote:
> Hi Vernon
> 
>> Brad,
>>
>> It sounds like Intel is not the only ones that might benefit from a
>> service like this, so it might be a good time for a new
>> project/repo.
>>
>> Could you create a new repo for us: phosphor-u-boot-env-mgr
> 
> Will do.
> 
> It sounds like you are working on something that needs a new repo, will
> generate a new dbus API and have applications providing and consuming
> that API.  That sounds like a non-trivial enhancement to OpenBMC.

Yes. Non trivial changes require designs.

> Please consider having someone submit a completed design template and
> opening a github issue.  This enables the rest of the community to know
> what Intel is working on and when, and thus have input, possibly help,
> and avoid duplicate work.  Please let me know if any of my thinking
> here is flawed.

Not flawed at all. It has been discussed and agreed upon by all 
participating companies. It also greatly reduces the review time for new 
features being contributed, because the community already knows what to 
expect.

Kurt Taylor (krtaylor)

> 
> thx - brad
> 

