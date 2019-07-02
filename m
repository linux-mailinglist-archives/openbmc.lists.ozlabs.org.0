Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BAC5CA01
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 09:36:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dGJ61yh6zDqQf
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2019 17:36:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Csxi8Fki"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dGFz2hJFzDqR2;
 Tue,  2 Jul 2019 17:34:15 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id k20so8451264ios.10;
 Tue, 02 Jul 2019 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w6xlQ2o+UcP3zwYSNav3RAmu/bkKy1papufzX/+zxYE=;
 b=Csxi8FkiVqHosx8bZ+86870ybq8A7F8vSFNwMMaT09FSF4oeEn/ngus3ZAwzo/VDkI
 Iqlt3Y/UA8f3H+JLxeiP5vaKxcSLS18l7q/0vg31wy6zQDn8rosTeJ3lyB4/hMk0K3RT
 eCsGn5Thv6UUE8nGjzC6UCFY8R1ie8NGtRwYdfFbbNW9qbVoEyCelahf2bxPJhkN+gBD
 JJP6cxOmy2IqfxJBBuX2YIwIbVodvGb4p1hujwtZfuy6L4OMilvvMt6cyb/LAD6NpYxR
 Z9wtph4jlRPA0qcRWToMhFs1iEXR/RU/lAnyEB2rieDw6usuIbgHZpno2VuGWgCSjL5C
 gx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w6xlQ2o+UcP3zwYSNav3RAmu/bkKy1papufzX/+zxYE=;
 b=oZMAZb0PXzGHfTap6HmrK5BEtvXshpe490CYRbt6jTVGr/wZj3qY4rJk3qNqwYX9Yk
 D50A+x7odRHWDIdb20UPL3uSwx3oIPq/zx6+9fkTM2YgFrOguUez9MgsV+1VoibTo/Ji
 XiBXouayusBB9JdEdmjJnpfOlyKGT5p5KYECy4OHSWIbCRRXScZ60nYkMldmUOGifvqG
 ohUldftvWomsHCIh00k4th1Sg79LUwL8KAx2SRZhcs9lxyynt2WE7GtbuZ2QQ0XKCXcA
 IxP4fyJTRjBwnZYwvmFF6Yp5B3ZwS/gGSWNhk7Yw4pMK2ZbdLHD4ZiFC/Re3QeRky7+b
 +LgA==
X-Gm-Message-State: APjAAAWkxU2blyQSuf5pb9mMkpcLWQ9MCCEt4lmOC17+73UQtyNH2R6X
 wenrlHVVf5zLDlTS+xkgQ4eDI6eL+h/CEyHc+Rc=
X-Google-Smtp-Source: APXvYqyebedwzvCHYuX9Rfaa+TXi2w2Z107Ka4qWzPcqpqRNPvbHu9NLLCcTYJjdLCBPZolBkfCMdKVuWnxty5IHz44=
X-Received: by 2002:a02:85ef:: with SMTP id d102mr35342188jai.63.1562052852035; 
 Tue, 02 Jul 2019 00:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <BB3AF06A-F1A5-4999-8D8F-BD58F39D68D3@fb.com>
 <0949cd7146560649af469c88e0e38c18@linux.vnet.ibm.com>
 <6975825B-D712-4004-94A9-2E70DE34F5DE@fb.com>
In-Reply-To: <6975825B-D712-4004-94A9-2E70DE34F5DE@fb.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Tue, 2 Jul 2019 10:34:01 +0300
Message-ID: <CAHsrh9KjVJQi3hmNsMMBhq8dVa0c_js4wysPBi37x9oV65QCKw@mail.gmail.com>
Subject: Re: obmc console history
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There is no any config files used in runtime, you may set options via
command arguments or configuration parameters during build.
Make sure you have unix domain socket file defined here:
https://github.com/openbmc/phosphor-hostlogger/blob/b8cf26fe933c7f020f5195b=
9575f596b9cb23719/src/log_manager.cpp#L38
This socket file is created by obmc-console-server.

--
Best regards,
Artem Senichev

On Mon, Jul 1, 2019 at 8:23 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 6/26/19, 1:52 PM, "Joseph Reynolds" <jrey@linux.ibm.com> wrot=
e:
>
>     On 2019-06-26 14:42, Vijay Khemka wrote:
>     > Hi,
>     >
>     > Do we have option of storing obmc console history somewhere which c=
an
>     > be referred later on.
>
>     https://github.com/openbmc/phosphor-hostlogger
>
> I am seeing following error, is there any config requirement for running =
this.
>
> Unable to connect to host log socket: error [111] Connection refused
>
>
>     > Regards
>     >
>     > -Vijay
>
>
