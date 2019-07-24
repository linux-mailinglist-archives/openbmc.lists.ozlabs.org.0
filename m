Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E0A73480
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 19:01:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45v1pp0bGlzDqNy
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 03:01:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEJJqWug"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45v1p86xZgzDqCY
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 03:01:18 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id r21so42563034otq.6
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hy2eLKjP/e/MD/PGQLXqRUVfiwXBVwd8jrQgHRGWhqo=;
 b=mEJJqWugjNxlanZMOPz1JK698qd8rh+K2SqwNbgt44/JuYbfGLpL73VHVTqOVgc4Hg
 8RQqa11o+dJzfqOJ01l5gFkGwJu6JL+TOI/pCZtuDeIsaMGDsDad3UqaY+hxpxACCCKx
 ey7dO4A3yzK7v1INWB47FsZcpjMYqq44DkUUem5KBTDxqbSJEgCB0rU8G0ER1BIyotPb
 ScoZMEYydr+xZNdx8hg+34/HE1Cs4N9UWedx5xGxvNId1517E2TIEgxbGnukY8lrn0Gy
 M0PD1PeoKf4mbHB3tObmZONQT3Hh4jIvR4aPqVNGxQ45/aApqLbNJGEL0BxK5lePK+jI
 4AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hy2eLKjP/e/MD/PGQLXqRUVfiwXBVwd8jrQgHRGWhqo=;
 b=hTVVP02zWdw/VgANus24kjsE9/IPLCRyxgfarqhprIrJWfCDbXrcEH6sXajsw+eKrg
 NEYcbu+yhoGhuG41oXzCkFupJ5TwlKUguXgFgFvoFOCqj3b+OZNJHLB9HWAiepx8uiau
 QlHAFy9GkPKUxa1GOrQKj6PgC+D9rq0XKMDq+mR8dwy0v4D4ax46/Lb18itTz+gM383C
 3bs18kqfH/q8qpsAlNk6HaH1h4U995yEPyiPu51zDbcBGqYeNInwbqEclr8ZdEqTY8yS
 Vkj/pOi4m8RCJ5364vLt1H11wTS5LJ1RtxJcKnq7HN4gpvpPVerXC+g1Q/Al2XKlA9OI
 qJsw==
X-Gm-Message-State: APjAAAWAzknqGRdKOxWos47oax5J0K41Hl25/5ZRfHtdQPnJ/m7fjrk/
 NidhF7vY1dvfAqZS743Co84yhXHxBKM=
X-Google-Smtp-Source: APXvYqyiYfe2uJtVv7u0yNxihj8agVAeaAcuCEq+5EAyiqhV7zsiw5+xDV5r8+kZcl6ca0c7Yhwlpw==
X-Received: by 2002:a05:6830:c9:: with SMTP id
 x9mr4897046oto.332.1563987674579; 
 Wed, 24 Jul 2019 10:01:14 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c66sm15439339oia.58.2019.07.24.10.01.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 10:01:14 -0700 (PDT)
Subject: Re: Updated CCLA/ScheduleA
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <5A03B567-254C-4866-AA59-8C8EC5B833F0@fb.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <8f56ff2c-b630-3645-4799-42bc6b017121@gmail.com>
Date: Wed, 24 Jul 2019 12:01:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5A03B567-254C-4866-AA59-8C8EC5B833F0@fb.com>
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

On 7/23/19 3:41 PM, Sai Dasari wrote:
> Hi Kurt,
> 
> Please find the updated Schedule A of CCLA from Facebook

Looks good, thanks for letting me know and for keeping this information 
updated!

Kurt Taylor (krtaylor)

> 
> Thanks,
> Sai.
> 

