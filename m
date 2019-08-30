Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 985BBA2C7E
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 03:49:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KMqH4s2yzDrgn
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 11:49:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::335; helo=mail-ot1-x335.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EVvhFvGX"; 
 dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KMpK4BS0zDsNT;
 Fri, 30 Aug 2019 11:48:55 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id 100so5465289otn.2;
 Thu, 29 Aug 2019 18:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y2jDAJQUkerTCXXMvvTfE74hBR7qHn7jlgj8F3IOxek=;
 b=EVvhFvGXIART4yQnJzSCnmqCIz+RF9Jcs5REnqmMP7ZbxP4u+jDk48KVlxpu0uSY7D
 ctgxlutfMbAnHGckrkvS9QIwbOJ/VxpV8ux4535gYtJDseDDVqdGpxa48Eq29cybMGOF
 60y8ItHMEflWXFAGu9ruLul7Bm7eBH29xBKoYV2JUHi7vSq+FUAxRHU2x5fQIStMpaJr
 oYPzSFhybSoQ1lOGOJjHXKB8QRG45egU/bY1KEEqgC/yl2BLp4bdiZb0MxePpzfs0C0u
 YOh0CYGpMvrYOSiLUwNaTjDF2YlbBDfuKchR/x5D9dV5Ci2K7ZbED0g0g63alz9FVtUy
 2pnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y2jDAJQUkerTCXXMvvTfE74hBR7qHn7jlgj8F3IOxek=;
 b=e/bEVHmFmhTjeNPwiTDQAaT5OPdrxFMLNE0Amdu3M3C4nttVN5Ic0pDUBMTHmNshgR
 FujhL9VCj13gqYNvi4S++T/arf8FZZSXLQzcq9A+riNXM/Dhj0fD/iFR67FKr6SOax3d
 WqHHsrM99XLCsenek0haLP450p3lRoRq3JeLtydGjNmHEDc0OxQUizSKiyddmfnh6kiC
 DrGMr6NUXSK19DkW/9jW1bNlOpTwV2MsYPfIxGnsOVIhKyr8IVl5vFHCE5Ld/oJLGJgY
 WCwymIWrexD65bq0DAHoi7zF+BClGfC8dbvOCb4v7FTJiudvDsA9pkK5bTS1pxM10svq
 7Ieg==
X-Gm-Message-State: APjAAAUOoPlmfX+nAcuw9/CUAXUz1ZnTqioReEqBftpXwd/aborHECKf
 ScgZmKFopqv5AKl1p5B5iizzJ6YtHnOwg4wNVss=
X-Google-Smtp-Source: APXvYqw1qm380B4BWbVCmiIycOKESi9a7oTov5KY5LOjfDsbMYuzB2fHKV6N3BzUAKaikU60e7EskVx/m/fXRITtMfA=
X-Received: by 2002:a05:6830:4cb:: with SMTP id
 s11mr9918450otd.366.1567129731963; 
 Thu, 29 Aug 2019 18:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <bcf71058f3494169b90ee051e0079bb6@inspur.com>
 <d0bbfd57-1b31-a34f-6629-896e963e357e@linux.vnet.ibm.com>
 <df0878a59968e5bbb35d29334ff5672a@linux.vnet.ibm.com>
In-Reply-To: <df0878a59968e5bbb35d29334ff5672a@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 30 Aug 2019 09:48:39 +0800
Message-ID: <CAARXrtkzNKLsfCqNotJfVP52BRkXUyQcfH0KgHoNMbKU3=5GUw@mail.gmail.com>
Subject: Re: Document about the REST interface
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

That is a good document (although it contains some non-English characters,
which could be fixed later).

I have a question that if it is meant to replace the existing REST API rela=
ted
document or not.
If it is sent as a new document, my concern would be that we will have too =
many
documents with the same topic.
How about split this document into parts:
1. The REST APIs introduction to replace the current rest-api.md
2. The REST cheatsheet part, to replace the REST-cheatsheet.md

By "replace" I mean this new doc contains up-to-date information while the
existing docs contain some out-of-date information, so the new doc could
replace the existing ones.

On Fri, Aug 30, 2019 at 1:53 AM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> On 2019-08-29 06:28, vishwa wrote:
> > Hi Ma,
> >
> > Thanks for putting this together. Could you please create a pull
> > request so that it can go through the review process ?
>
> Here are the guides to submitting a patch via gerrit:
>
> https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-ch=
anges-via-gerrit-server
> https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md
>
> >
> > !! Vishwa !!
> >
> > On 8/29/19 3:17 PM, Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) wrote:
> >
> >> I wrote a document about the REST interface (contains the REDFISH
> >> section ).
> >> It contains all the commands in REST-cheatsheet.md ,
> >> REDFISH-cheatsheet.md and a REST related document.
> >> This document includes power, FW update, time settings, event log
> >> and related commands.
> >> All commands have been run on the fp5280g2 machine.
> >> I want to upload this document to openbmc/docs because I think this
> >> document is good for the community.
> >> Can this document be accepted?
> >> Here is the link:
> >>
> > https://github.com/inspur-bmc/openbmc-doc/blob/master/user's%20guide.md
