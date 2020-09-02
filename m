Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9C025B32A
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 19:47:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhWcV5TCgzDqj1
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 03:47:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=j012eMvA; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhWbg0z0HzDqj1
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 03:47:08 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id r7so91228ybl.6
 for <openbmc@lists.ozlabs.org>; Wed, 02 Sep 2020 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8WU1d1E5AY9M99kOkBe+v/96gWJBLYzNC0iThEEXBhk=;
 b=j012eMvAW1KpGLzzpvtySmOmdJIvNB+TCCGs8zdq7Nm/Fk9LrIWBVymzE1oanRtVjI
 6oEQ/vO42fTzfIhWdBeLvIWx1DtK0eushZabPn8WBXCb4GMzu2T2mlBeC1Rjg8qhD1Hj
 nHr203rC6N+H+3aHNGqEF7+Bd+KsdNdgoHKVPXhzmntoVAXyvUJGRogefcqRwAoO/q3a
 LAE5T76Q1iwCyqN5x2YS2cW47ZIjeZcJSaQdMtfWqTry3zkV6hM03soERdkl1XR/Yzei
 rNeEruUceiQ7ifLoLPhGV3gj/YKEf8cUHkYZ1r9C7Y84q3qpT7QedqGIJjNQETuqHlMI
 spvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8WU1d1E5AY9M99kOkBe+v/96gWJBLYzNC0iThEEXBhk=;
 b=f1fxMEpHdkrjgJ95TrMULrFDPVWa/gjkyxYGsOhiHt6IPGa165wNGozDMbDyrBhzcq
 MWUmIxHrXCofOBs+cNamxpiIEkSZVSj4+U9xtzIHc03CKvf5832eZ5aZs/QrcpuZF/QM
 CVUzZlPT6y/IMvP2MptUzTBaVOaytE5Ii6imqgzwLYGUwdT7xAINSnOweCajOFs4McDI
 64c80jyS0qIuK1ohPdyLuMRuNg5ov9x7curYPa2a4PwX5pHbcb48eDDr3XymgUeVTcd+
 snVmgzF/McsD1/8WkhzReyWVU9mh9ZtiqUbyWeI73GOXWalpLx5GgyTzKXOghD5Lad8O
 u2PA==
X-Gm-Message-State: AOAM530WYL2RdyQR6Hd4bFCiF6clIAa8qVuKkpHuix4n+3W+bkWlnUcK
 K7MDN9IcDzkT5WKkU9duzyCbSl/v2txXBkQii768Ow==
X-Google-Smtp-Source: ABdhPJzMaZ1/0nEXPcd+j8uWDWrNBgBwDVXG3e45Cw2RWteRGjUdX1fKCQuf+1UIkPtH7xl1V8lDxSSKRmdk4ae+Hms=
X-Received: by 2002:a25:f304:: with SMTP id c4mr10248887ybs.209.1599068824544; 
 Wed, 02 Sep 2020 10:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <98b9d39aa9004df78f8072ee6bdf4901@quantatw.com>
 <CACWQX82NP+SPyHoPhkri=3eT+7jJYqmuTdwcTy2qDV0mTzrWkw@mail.gmail.com>
 <CAH1kD+bHghGN_Gy-rXNyOZuyYJm585GK9KVCp0YOH-z8TOsnVQ@mail.gmail.com>
In-Reply-To: <CAH1kD+bHghGN_Gy-rXNyOZuyYJm585GK9KVCp0YOH-z8TOsnVQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 2 Sep 2020 10:46:52 -0700
Message-ID: <CACWQX81tzqMcYrGYFVQaF3O7zE8wsLjV-3XKx1FQ2pWZEs0JDg@mail.gmail.com>
Subject: Re: Disable specific URLs in bmcweb
To: Richard Hanley <rhanley@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?B?QWxhbiBLdW8gKOmDreaMr+e2rSk=?= <Alan_Kuo@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 2, 2020 at 9:57 AM Richard Hanley <rhanley@google.com> wrote:
>
> Hi Ed,
>
> In this particular case, I think Alan is talking about disabling the POST=
 for certain resources, effectively making them readonly. One example I rem=
ember talking to him about was disabling the addition of new users via bmcw=
eb.
>

Gotcha.

In that particular case, Redfish PrivilegeRegistry schema is probably
what you're looking for.  To handle that specific case, you would add
a mapping that looks like:
        {
            "Entity": "ManagerAccount",
            "OperationMap": {
                "GET": [
                    {
                        "Privilege": [
                            "Login"
                        ]
                    }
                ],
                "HEAD": [
                    {
                        "Privilege": [
                            "Login"
                        ]
                    }
                ],
                "PATCH": [
                    {
                        "Privilege": []
                    }
                ],
                "POST": [
                    {
                        "Privilege": [,
                "PUT": [
                    {
                        "Privilege": []
                    }
                ],
                "DELETE": [
                    {
                        "Privilege": []
                    }
                ]
            }
        },

I don't believe there's an implementation of PrivilegeRegistry for
bmcweb today, although we kept it in mind (ish) when we built the
privileges system.  If you want to chat more about how you could add
it, I'm happy to talk more specifics with you.

-Ed

> - Richard
>
> On Tue, Sep 1, 2020 at 10:55 PM Ed Tanous <ed@tanous.net> wrote:
>>
>> On Tue, Sep 1, 2020 at 10:40 PM Alan Kuo (=E9=83=AD=E6=8C=AF=E7=B6=AD) <=
Alan_Kuo@quantatw.com> wrote:
>> >
>> > Are there some configuration files in bmcweb that can be used to disab=
le specific URLs and HTTP methods ?
>> >
>> There are compile time options that can disable features (and
>> therefore URLs associated).  They're listed in the CMakeLists.txt
>> file.
>>
>> As far as disabling particular methods, why are you wanting to disable
>> them?  It seems odd to want to disable a few particular HTTP verbs.
