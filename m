Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8877423070
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 20:54:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HP6FX5GL8z2ymq
	for <lists+openbmc@lfdr.de>; Wed,  6 Oct 2021 05:54:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Xbypg8YS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Xbypg8YS; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HP6F95LS1z2xvV
 for <openbmc@lists.ozlabs.org>; Wed,  6 Oct 2021 05:54:03 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id e12so604152wra.4
 for <openbmc@lists.ozlabs.org>; Tue, 05 Oct 2021 11:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YTZv2LrAFwGE2cD42j/pA8Zen0jeVffrAGs6LqG2WSU=;
 b=Xbypg8YSEBoUxSLuE0kJ0RGubPZMeZk//pD/0rghOFON1vnQKK31+0NYKOuQym3F8s
 W1BTEaN/nbufrhHx6rj/M+2PR3WDitIZrFpwgdAzw0xBxP4ZZobZmkm3Q0CkHnpyMZDB
 qLT91i7PHcY9UQqknNgWhR8vRrxfowwkh8chqClZwwbnCH57CI2w4/K+p5CphlQhhA1s
 6YsimpDXsZeWC5znprPzkGl3+8GrNtaMhCwMFFShNZDJ/lsOD15QslSKYWq4Q08DV9Cn
 IyhCF01MF2yi3wGyN/OgofXwgjC+DY17OioL01GwMvHaclrhXm9Ws6FEgS69TAHCpcOv
 Pnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YTZv2LrAFwGE2cD42j/pA8Zen0jeVffrAGs6LqG2WSU=;
 b=XOnzcqIOFKLSKXc1AnAJIDxoK1oKUzL/LpY2l6e2aBaB01UPUjLcMzMLSVWC558L3V
 Rcjv5J3+v+yGl3vk8iyrkD1Mm0HtZCFt8uRfgleUXuqmO/4j40G4hQdrrSQYfR6L7ayH
 02jIZ3Xt/8dNxDKpYEtulOR37BCMynl2zCFHgKN/0T4MFM/7kfr8RlBe6Wth3jRaaeCc
 LF2Thuj+5Q1ciSNc9lycRcSUnZ/fqmLha7XYtyfaEYfoivXiJpkMILxegrDqpRavWW4b
 FEofROuLd3biRjFZE7rx18CT68rWTFM+RidDYq6ulmMCeweUEsD0wMayh2YoIgn4c1BG
 nvBQ==
X-Gm-Message-State: AOAM533yq/bkMUgCACSYcx9Hjgv1JVA8PWvMTB9Mvy7pv/6TwN7RQp7s
 FwW79Xa2JL4mCRjZwT5j/vDVwd+5zTtlcJ7+zG9JOA==
X-Google-Smtp-Source: ABdhPJwo6eyahr2SbWeam/r1ZGU2fVmz7rHPsO4PWeJ2l/aq6+dP+VHd8xiBvl5OW+Ta8MmMV6uNdWuwkK/S8TAhZcM=
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr23046580wrs.26.1633460039080; 
 Tue, 05 Oct 2021 11:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+H48BRUkTwQ-2NtJCQZrF_RyG3p9oUFzP4cqF5iVDEy-dh39A@mail.gmail.com>
 <CAPw1Ef-nyZB1JJax2Ca=z5hWoBxAg59WoFCKLA4TG+Ln0WyMFQ@mail.gmail.com>
In-Reply-To: <CAPw1Ef-nyZB1JJax2Ca=z5hWoBxAg59WoFCKLA4TG+Ln0WyMFQ@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 5 Oct 2021 11:53:47 -0700
Message-ID: <CAH2-KxCKuUKyDdA+qc8rexiH6O5-EHk6UPmUUmPwnjn0wDLW1Q@mail.gmail.com>
Subject: Re: Performance issue with redfish TLS handshake
To: John Broadbent <jebr@google.com>
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
Cc: sharad yadav <sharad.openbmc@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Anuraag Bharadwaj <anuraagb@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 5, 2021 at 11:48 AM John Broadbent <jebr@google.com> wrote:
>
>
>
> On Tue, Oct 5, 2021 at 1:42 AM sharad yadav <sharad.openbmc@gmail.com> wrote:
>>
>> Hi All,
>>
>> We have tried to measure redfish APIs performance benchmarking on AST2600.
>> On redfish GET request there is a penalty added for ~100ms on TLS handshake at

This is a little higher than I would've expected, but not outside the
realm of reasonable.  Can you triage what cipher suite you're
negotiating between the client and server?  Are you using a DH+EC key
cipher?  That should be faster than RSA.

>> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L297
>>
>> On trying below all methods, each request calls `async_handshake` which adds 100ms delay
>> before the actual redfish handler code gets called.
>> Method 1:
>> curl --insecure -X POST -D headers.txt https://${bmc}/redfish/v1/SessionService/Sessions -d    '{"UserName":"root", "Password":"0penBmc"}'
>> export token=<Read X-Auth-Token from the headers.txt>
>> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X GET https://${bmc}/redfish/v1/Systems/system
>>
>> Method 2:
>> export token=`curl -k -H "Content-Type: application/json" -X POST https://${bmc}/login -d '{"username" : "root", "password" : "0penBmc"}' | grep token | awk '{print $2;}' | tr -d '"'`
>> curl -k -H "X-Auth-Token: $token" -H "Content-Type: application/json" -X GET https://${bmc}/redfish/v1/Systems/system
>>
>> Method 3:
>> curl https://${bmc}/redfish/v1/Systems/system --insecure -u root:0penBmc -L
>>
>> We want to avoid this ~100ms delay for better performance.
>> Please suggest if there is a way to skip the `async_handshake` call by modifying the requests method?
>>
>> Thanks,
>> Sharad
>
>
>
>
> There is logic in the crow::connection object that should allow you to use tcp keep-alive and avoid the handshake in start.
> https://github.com/openbmc/bmcweb/blob/master/http/http_connection.hpp#L694
>
> I have looked at the connection class in bmcweb before, and found it difficult to understand.
> However, this is a simplified version of the states within the connection class:
>
> start->doReadHeaders->doRead->handle->completeRequest->doWrite[if keep alive]->doReadHeaders
>
> The async_handshake is in the start, so if you are able to use the same connection, you should only pay for the handshake once.
> Ed Tanous and Gunnar Mills are the definitive experts.

Yep, John got this exactly right.  Make sure whatever client you're
using is taking advantage of keepalive, and you will only take this
TLS performance hit for the first request.

>
>
> Let us know what you find.
> Thank you
