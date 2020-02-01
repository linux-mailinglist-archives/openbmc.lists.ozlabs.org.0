Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16C14F5F6
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 04:02:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488f606TFczDqj4
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 14:02:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HCA0soQ3; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488f5T3fC4zDqgl
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 14:02:21 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id c23so6213529lfi.7
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 19:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihkmy9LIOfE06P6MyVGT9QD2+Sy6gZhDw3R1tyiAqc4=;
 b=HCA0soQ3VNR0A4e4+BT2fkXFeMvcF11zfdzPUWGW9sbQEAvj7D3Nsb5UI5oHj6h6Ka
 lAkOfdCnluQ2KNWRq0sQIL17WNAAAAGz9SoOfwPyKucfOtDvZFBu7HscHBD6KTcSWa+w
 ho07dSvghYuNtLWRQv8Y7We9Aze20K4gNz3I4e9xPT7IzND6OX7KBOJODc/0OOCBtK51
 lqBiI2bgtdneUIoYbu8NdBhZDJeaUnfsVG6iUaWnFH9HA045jElf/fcB89gP3nvMn7Ar
 ZlTYlfw/bX62Gz8uDv4iGQpFGTljwUfdzxwUZHbBEmUktBxYTz9ww2zrugRYLQcSascR
 B+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihkmy9LIOfE06P6MyVGT9QD2+Sy6gZhDw3R1tyiAqc4=;
 b=JTgsuc55UJ9bBIXDYDY02jbBSIihttqcYHarnOIToLkjkTZXwGc+RyW8nmd1C2V7Ab
 GZRFS6b1b9SnxpLTYm96cdU3HqHXPKwtdOOwrK8u6AduHKSnsnbynQoZ+AshBd6vZP0m
 dZycshTx0nmqKw8+ovcQ57k/4usYNvW6TGUpmgnP3HQ21hcBhQNjPpOSzSCVltu4gWoM
 x6PFbIITBCRF5KoSzYJSNN/QD/67h5RzCvALK+qmfhL6W9eFnUEDptE55hopZFgzbVAr
 hZ37fq4OgWyamLzx84DBYH1ePyj1U3Rdol4na0irHylyljsVZ0NChehsM9DWBvPp/5oS
 XqxQ==
X-Gm-Message-State: APjAAAW8PJlY+aJlHtVcKxu3LG5p6NljGZAQa8Ss3SmD9EpvRpFFdNTE
 ZDV8txY+CB+0zZQc2vgML5uj2H81XnJWtBEn5FU=
X-Google-Smtp-Source: APXvYqyBdXAI/aRVr/AYhIFqmBia+851P09KyKeOTnVWB1gaVdgbeoXeJlh9VTtsl7RR3+yCHdrmfMkO3ylYdLq/6EI=
X-Received: by 2002:a19:4208:: with SMTP id p8mr7090763lfa.160.1580526136632; 
 Fri, 31 Jan 2020 19:02:16 -0800 (PST)
MIME-Version: 1.0
References: <CANGK-S4vcQ9P_fW6ev9h83=GRLCEDr9KeFH2gt-soQ9JpaY_Kw@mail.gmail.com>
 <CANGK-S4cpq51ya7QFv1jip=nZOOiDhqc+8PAJX7oOo3T0pN2Pw@mail.gmail.com>
In-Reply-To: <CANGK-S4cpq51ya7QFv1jip=nZOOiDhqc+8PAJX7oOo3T0pN2Pw@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Sat, 1 Feb 2020 11:02:04 +0800
Message-ID: <CAARXrtngjFeOrmNE-y=_uLkL9y0=UAJ5aDW73mR8eTEUK4yFZw@mail.gmail.com>
Subject: Re: Library to aid multi-part form data parsing
To: Asmitha Karunanithi <asmithakarun@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 6:15 PM Asmitha Karunanithi
<asmithakarun@gmail.com> wrote:
>
> Hi Brad and Lei,
>
> Are there any concerns about having libmimetic for multi-part parsing. Please have a look at the below mail.
>
> If there are any other suggestions, please post in here.

I did a search for the library and it looks like it's used in distros,
so I am OK with this.
