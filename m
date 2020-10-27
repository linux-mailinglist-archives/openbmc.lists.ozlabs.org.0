Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF829C86F
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 20:12:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLLtM1MKBzDqPb
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 06:12:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=W68TDDU7; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLLsM3FBnzDqNk
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 06:11:15 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id e2so2575864wme.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 12:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhQQWAIeBdsv6BDa/LpSLnT6A+JCeKB7Bwxve7UvBug=;
 b=W68TDDU7AeABYt6ZeMtBHxgVf6/INy+qg+9uVJsKHyx/e2eRMsfBUKOjS5OtEMoSaW
 x1Bq/fTNDR0zArBn6tMHPqVmSMukrvdRR2vYN6eEkRoAT+FZGzA3UR7Pl+dYvV2hnjlJ
 DWEX28FzHc//p1G/4YIcjUTT2EGdsZcknfRTXd3fkq5DbrAvVyhEQCvBuVvOfuUUoziq
 D8s4g0ypGaSh6oV3lLIxbUnG3c1fv21i9/Uor2+brY6pURbpZM0IrQj3VuZRCjvtFo6/
 ZaXGhoj8TjKunN//ABmE13vlXE1DHy/SjKICnnnaoAHFRFIm2qQFCdQ1mQ9jXk+rmG+h
 NI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhQQWAIeBdsv6BDa/LpSLnT6A+JCeKB7Bwxve7UvBug=;
 b=Z9FPb9HUeTup47KTGAXAaZ/qj1e/rGBarnJi7E1paMjyRqesYNUQ+Hrk5eKZHXcCyG
 6+NTBv4Nt4GfX1VAb6j7gKl72QD5F1ek4TQG5pxRyJieP3q7fgm9D35BwTHnBvzsqXY9
 iSZjUaadE8DaOJQD7YOcX+E0IUmeU5qAMWGRuF28eQBRy05utuo21hFD6JtPlaXnlZy+
 Sb+5ajTi0MFIRrG7ngboOyo9E0u94YoVEyxy0Jv99D52aY5c1wSjySrh4NnZsU3EyBXX
 WNTNiuWSSl+wS515vgq9xOlpRYMArUUA0DLxkAA9tqSKjVDUH2xiQC/67ZUmmocVKVsk
 hurw==
X-Gm-Message-State: AOAM533pPXfpQwKftLQ/qcq9Fw1sR+SEqo7CW26P6ozl1TT5qVMDoaIt
 iA9ld5lMX8OSRGY5ip2jb1bX7mkIEhzasLh2P9lHnA==
X-Google-Smtp-Source: ABdhPJyi0n/z0E72gnWzhSpesHSYWUDEakEAsle/KNMaP2iNnnKyR0yU9syK9Q1WKuFRJa84WAsKQ5BQKlAbP7QyIy4=
X-Received: by 2002:a05:600c:2942:: with SMTP id
 n2mr188883wmd.101.1603825870530; 
 Tue, 27 Oct 2020 12:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
 <E5370099-203B-4CA4-AD0E-671CD2303CE7@fb.com>
In-Reply-To: <E5370099-203B-4CA4-AD0E-671CD2303CE7@fb.com>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 27 Oct 2020 12:10:59 -0700
Message-ID: <CAH2-KxDbgY8kozOotA+qjzAP0cqTcK9Ooys9b05Szv4MRk8wrA@mail.gmail.com>
Subject: Re: VR control from the BMC
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 27, 2020 at 11:55 AM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> On 10/26/20, 4:04 PM, "openbmc on behalf of Ed Tanous" <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org on behalf of edtanous@google.com> wrote:
>
>     In the near future, I'm going to have some needs for OpenBMC to be
>     able to control VRs.  These VRs might be on the baseboard itself, or
>     on detected PCIe add-in-cards, and controlled over PMBus.
>     Additionally, I will need a "hardware safe" way for the host to be
>     able to modify the behavior of these VRs (usually different voltage
>     settings), and to have that interface be constrained in such a way
>     that the host can never set a value that's outside of a predefined
>     range that's known to be safe for the hardware, which the BMC will own
>     the definition of for security purposes.
>
>     Does anyone else have similar needs?  I've been pointed to
>     phosphor-regulators which has some similar parallels;  As-is, that
>     solution won't work for me, because it's relying on fixed, platform
>     specific json scripting to accomplish its goals.  My hope would be for
>     a more generalized linux devicetree based solution,
>
> Voltage limits can certainly be passed via DTS file to limit user
> application configuration setting.

Anything in the DTS would remove the possibility of controlling VRs
that weren't part of the baseboard, and would be a problem for me.
Also, these limits would likely need to be dynamic, and might rely on
certain calibration constants in the chip.  I don't think a hardcoded
DTS limit would meet my needs.

>
>     as well as a
>     representation on dbus that could be modified at runtime by
>     Redfish/IPMI in band.
>
>     Is there any other work I should look into that's similar?  Does
>     anyone have any strong opinions on how this should be organized or how
>     it could be built?
>
> I would also like to add VR firmware upgrades as well in this.

I don't have the need to upgrade VR firmware out of band today, but if
you're interested in helping define interfaces that would work for
firmware upgrade or make it easy to add in the future, I'd appreciate
the help.
