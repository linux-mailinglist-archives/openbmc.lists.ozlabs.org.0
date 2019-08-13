Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0135D8BB99
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 16:34:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467Fbp4gsyzDqhm
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 00:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FJqLB/xv"; 
 dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467Fb14fhyzDqV6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 00:34:04 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id g2so51727592pfq.0
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 07:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=09u4JskA+3aE+Scr6blsc0BNOR6n6znuwfJ5ahGrQIU=;
 b=FJqLB/xvGsTroSp9rdlci5FIsmwFFEj6hEjSR7pH/jHVTMihU6ba09QH2pMedfs57D
 YPX7NVte2VdObisINkYAHundV2JfQhC28UY7NVtVzkw3hIcqBZi/gbX3NhSUZm3LQ5kG
 1UqiwB/LShvqkmjFk8yc+3Q79QaLtgfBHQzxCKbzLMyfxWwxyVa5hj7PNe35rjEn5cFn
 g96xdcbB7TfsCh0t/ZuCSO6WC3dHNF4Ntp/T/t1BQqxgNpY3OGXMKK5mXB3RS9lXvFt1
 1yA+eDGU8vcBjE4YmovjjiTi8DJlFPkRVzxdlSwNRQ752m3TmoMGZfBOTkbHPYiA74ZY
 esFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=09u4JskA+3aE+Scr6blsc0BNOR6n6znuwfJ5ahGrQIU=;
 b=L9q8KGdfjwt2SlaAc6TvCswpvIGbgw/ekH/oJJpbBg/926xAPn1uPfEccZ19jGFBZQ
 C+VB0bZf7DaTcFqwuUeIdq+gzMeONSfFkxt69f7jr7wFjwFMvWmBCH/Ud9wATk+vB1q9
 NaMaE+70Pgl+auy9+LVdwskX8sSEiz8fMfiAn56hmS6FOYhFGNJCj+WCww4OloieGSVT
 0M6v9dtdHrWUY+89XoUmHOAKxIxGV4s1NRNgsFxo+xojquxMVAkZgn9/Q2+j8bO4tYp5
 A5aRBDI59esq/x1eV7ffCcGu9FR3vPURi6H9TO+LYxkQDEspZUvqv+vfj13pzc8G+Fqs
 450A==
X-Gm-Message-State: APjAAAWom23efUzZPi+PfxdwoIqfhj639c75jH5M3nOcHUs2RnCuGXRL
 Q47SU+T1e+srfK8zElz6V/qeVZKiJFizWE/QVfi2jw==
X-Google-Smtp-Source: APXvYqzkqGUMKkE+qGSmx1ztWPBca/2qMyt69x5Dpfi/tvE70bsvjUw7J0PruxxIb7MxQLGvjjigYWOE2f9z4Xelb9g=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr41157682pfi.136.1565706840612; 
 Tue, 13 Aug 2019 07:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
In-Reply-To: <8c0e07bacc89478996cca5f6718fe715@lenovo.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 13 Aug 2019 07:33:49 -0700
Message-ID: <CAO=notzwOqKnmhB8Rn+0wAGua6OzpjjNDF=Va4Wyt7p2z9ES8g@mail.gmail.com>
Subject: Re: Clarify some questions about host tool (burn_my_bmc)
To: Andrew MS1 Peng <pengms1@lenovo.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 12, 2019 at 2:43 AM Andrew MS1 Peng <pengms1@lenovo.com> wrote:
>
> Hi Patrick,
>
>
>
> 1.      It took about 4 minutes and 30 seconds for BIOS update with 64MB =
rom image. Could we extension the pollstatus time from 100 sec to 300 sec t=
o get the final status?

I'm curious why it's harmful to check more frequently?

>
> 2.      If user can choose to preserve BMC configuration (rw area) or BIO=
S configuration when upgrade firmware, do you have any suggestions with reg=
ards to preserve configuration implementation or could the host tool suppor=
t to send a parameter to support it?

Since one of the design goals was to keep the interface from the host
simple, and mostly agonistic to what was taking place, consideration
wasn't given for a mechanism for adding extra parameters.  We're in a
similar boat where we want a mechanism for changing the level of
upgrade, so I'll go over the design today at some point and see
whether we can do it agnostically.

>
>
>
> Regards,
>
> Andrew
>
>
