Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653B12F24B
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 01:41:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pmL61w2hzDqCM
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2020 11:41:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Kgou/ZBd"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pmKN4qKPzDqBs
 for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2020 11:40:31 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id 5so35850946qtz.1
 for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2020 16:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1qfkEat6mtTRQSRtoPzanLnXepA3KGqA5d8gACRDY6Q=;
 b=Kgou/ZBdkOlBwrtV7l7eH2IaJoqo9UiY6WJRHeATS6MmBpHDmp955xFv42zHjFzNu1
 iXCJmFXeY8uikAEDYpN0vIaX71gpXPsWNgVDOmZRIzBCEh2BCCmQ+J7x32CagoviN2bu
 g9kLpVgDwYNiqzl6XepfG0i5Bkq2RGZClTPFzsPtvHdNB07wYLDodTja3RrM22UHCEz7
 oTQ6xo2tCEHLHq50QQI5LGmvTR3hVOClD3JAZ4kQ51UYvc2mCEFXUGCG4Ridesg7EySL
 i+138tlWDuKV4H02R0PEa6v3etzO/ht/qDH2HWJD2wqCi48VjncTMz1r3EuOn35JRayA
 AFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1qfkEat6mtTRQSRtoPzanLnXepA3KGqA5d8gACRDY6Q=;
 b=Jig7XJ1CC1szAffd7skx2PsYUSKIuO+tiESD4mwpvsSYgACmN+jaFvA3tEZzcsai1S
 VFQvvqQdEZT0CW5MVVsAwgtbD6+6nbNAbwDMrN1eXkNWdbi2Ta2ix+c7FApUKnW5iCvJ
 Amt6mjEXx27JRmp8JERh7B6KWQ2t6smG+VDhQRlmhDg+kyjMsZ/Nal/MAmcVUFNKf+Zq
 cplo05e6QqhlX0tXgQhtGHEZvEbEa/URQNaUi9WiPlS5tlsZPTCzCkbEpbVKmP2hXfM6
 kzuyGw7PBuhSFCbpblH6vmqiJXEcxTXvXw1UNe2Eu89BVOgYa2/FxGvowDiIYNi7gf1T
 VAlg==
X-Gm-Message-State: APjAAAW0pAOmz5O1QWb+7cwLUnlz0zM/qEgssmwYjAaNE+eAb1iRNiq4
 jX1guoMGxb+kFF99FvpYw6ibCQ88+CgahddaK3lRCg==
X-Google-Smtp-Source: APXvYqxkrXABq7vF7+ModnnJE7Z3HPZKMCCzST2zVV38dQForfE5ntZM7nZEw7+Rn2iYfiNhaBDRPDG6Gy3sOebhV18=
X-Received: by 2002:aed:24c7:: with SMTP id u7mr61569204qtc.335.1578012027705; 
 Thu, 02 Jan 2020 16:40:27 -0800 (PST)
MIME-Version: 1.0
References: <DM6PR21MB138828CB98B178632C9E07F8C8230@DM6PR21MB1388.namprd21.prod.outlook.com>
In-Reply-To: <DM6PR21MB138828CB98B178632C9E07F8C8230@DM6PR21MB1388.namprd21.prod.outlook.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 2 Jan 2020 16:40:16 -0800
Message-ID: <CAJoAoZknF6Aks9TU0Vt1v9tCw-L36p9KEBpaOUseTQLpvXvuVg@mail.gmail.com>
Subject: Re: Sensor Data Record ( SDR) support
To: Neeraj Ladkani <neladk@microsoft.com>
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

Currently (most) SDRs are populated at build time. It is certainly
feasible to add support for runtime-provided SDRs, but it's a somewhat
large effort, and I don't think I've heard of anybody planning it
(correct me if I'm wrong, anybody). Your best bet is to take a look at
how "ipmi_entity_get_sdr" works and try to come up with something
along those lines.

"Get Device SDR"
https://github.com/openbmc/phosphor-host-ipmid/blob/master/sensorhandler.cpp#L914
(This has a couple other calls for FRU and entity SDRs inside it,
which operate similarly to sensor SDRs. FRU SDRs are populated the
same as sensors, but entity SDRs are populated at runtime from a JSON;
see https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/entity-example.md)

A sample sensor SDR config:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/sensor-example.yaml

By the way, the method I usually use for checking if IPMI supports a
given command is to look for these kinds of callback registration
methods. This one contains the callbacks for the Sensor NetFn,
including everything we do about SDRs today:
https://github.com/openbmc/phosphor-host-ipmid/blob/master/sensorhandler.cpp#L1107

 - Emily

On Thu, Jan 2, 2020 at 4:28 PM Neeraj Ladkani <neladk@microsoft.com> wrote:
>
> Is there any plan to add support for IPMI SDR ? i.e to support adding new SDRs using Add SDR command.
>
> Neeraj
>
