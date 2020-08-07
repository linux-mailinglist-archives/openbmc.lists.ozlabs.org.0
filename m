Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8427823F15E
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 18:40:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNWLF2G6vzDqsR
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 02:40:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mf54DpL5; dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNWKY39FbzDqNb
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 02:39:28 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id e187so1323058ybc.5
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cg7nMir4mTMiv+p5ljvwSS0j4TigTD5pMijAiHlW6eQ=;
 b=mf54DpL5xVsZPFNFDKP47Qt+QCdlZhiPLfUQMYshTd46Yq3m6xIienNrwwwfRlJYg6
 VIdKg1M955wJuIxOI7CDTO948YFYi5dQC7wSMIBS3gYN/4MVEIiz1t9tlxzeS2CNR1tY
 5wHQK3TJCGws/pN0dIZ+fnOH27OK9rOe0Id74UW6mvEEJzzb0i0G46peZYPACAOimZnd
 YQb/k5hpA9zakYyIYft6XTuRSbVjhG5lYayrQxuu7cnMOjNY8qgsD1U/+XWQpc0y+yPv
 SDmA5N8K2Rjope4anv4eeqdP5XJ40hQ1iIhB4Uj31fW4A3c7uo5JokKYrFx0Nk0Fvrth
 cASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cg7nMir4mTMiv+p5ljvwSS0j4TigTD5pMijAiHlW6eQ=;
 b=TnVmMic/5bzcn+8iYOIA3K/OmlG+v8lPvIFECnTFo8nILSdGFWQS3h/8KghQ7LshMG
 psRlLLwZksCie0DLqh0H+/h7gfJlPVjvxKiU76exCRM6/Gg5TAXPlmhl4fLa+5NTw/5l
 So9j726ZlKW2vLAaeZMenccDIVfcosFs+O+suRzvQzkdmQEUaY0Uo54QQ6tk6pdbCMtT
 e5ZwLAqP/jVpIESS7plRkjZlcYpxLFAOWTlRGMF7zH1vI4jVVtrgCtPPwE6fTtT+cgT5
 TqCkJSUL09lmOKwGHajsdzjFmAUIQ290dOEcPCkhrEJKTHCvink3alYmU1krzXbsRrop
 +ggw==
X-Gm-Message-State: AOAM5317GPSD+mV5tWUZZBgmdU67w6G9Tp9NHIijtQ+438AbQlk9CZrR
 FA5pwyLQgMvw+7SbKydmGArFo4m/DO3Ugs7lfPQtCg==
X-Google-Smtp-Source: ABdhPJy+piSA198VLzhHrEYonsoNt3FbK487s1r9Ci1pJ/ePT0Saa1K7U3XQtgLAh/fiyARO0yuR7dkymQuBmenKgN4=
X-Received: by 2002:a25:d48e:: with SMTP id
 m136mr21736544ybf.148.1596818365034; 
 Fri, 07 Aug 2020 09:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
In-Reply-To: <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 7 Aug 2020 09:39:13 -0700
Message-ID: <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 9:36 AM Jason Ling <jasonling@google.com> wrote:
>
> Slightly different topic:
> What about making the device/type lists in PSUSensors extendable using JSON?
>

Say more about what you're wanting to do here.....  Can you give an
example of what you would use it for?
