Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC258E523
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 05:08:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2ZdK6cJZz3bPP
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 13:08:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=cKsLOaoq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=cKsLOaoq;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2Zcw4gstz2xG4
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 13:07:59 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id h13so16274018wrf.6
        for <openbmc@lists.ozlabs.org>; Tue, 09 Aug 2022 20:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=M1oNMEoETCvhj1nnlhFvE1cikmlEVphI4ljt0g5md1M=;
        b=cKsLOaoqj6ECr+15sLZ2eVYnuLmc8N5KGduXw13iTL603Zr4Rs5/537kNLchvFwV1k
         jkb9WlU8IeVncoLyvKSk0XVODZEpIE0g+d0jMXC1VoK9xnmalGODrZNQlsgcBBkhzqBF
         LNART+3TZvtofR9pDr06kyrKMPQlT8fBfPLC6NTOsfh579LUk7PeclfvnL3Gp/b4KDub
         PCVmkLnBRiHvR2cNgoWQv/8j+vAUj7695gaAs6pFXV3yU9QlYCxaAVsZPFdMRaXb6rUN
         53W4fxlm59qhZOp/p8PJR+qFqachOHd5PNj0J1uavhJReMdW6kUM4YdTVziVFXenYdys
         yOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=M1oNMEoETCvhj1nnlhFvE1cikmlEVphI4ljt0g5md1M=;
        b=JHAV4mjDzRQJoDVcV3FRzZJSAZ/K/Xl3uupV3BlsKp6QzAaXoMUE8tH4CIm46ekXKF
         Dtl5G2MJQPc/Q/FmbAWu3m6wuxM0z4DInYWBzbDwnUyzbqezEFUlYL24T4+gZ7C0+IRV
         oWNPnOK+TQi4iGZD1XY8JhayrsWwjHh9ZLkeonb7lOAaRUqOsfKuqDTbAeQy7Z+B2B0A
         1tWXV8rqDAvz5dBoP3z0ruEZT+XYlpLKBXFBN+ZLz2JzqBVmPOmf30JaJkHKvZRyIwjT
         8NTYrOtlQMJxTLPgobwP6d+tXmmA5GhW7SheU/r/yBvafOYb785F3dG3Fw298VfZxqPv
         g0PA==
X-Gm-Message-State: ACgBeo3kyYluvf7RoSLP1cfibsepnF5j91Y7MH099gizdtGg7EiIn6mp
	zaRwmz1bLPxe443UPK/+bwjep61avitMNMD9pR4y5Q==
X-Google-Smtp-Source: AA6agR48zlid5mrF1XaQidPy9SKLgliICYv4/4XZ+zPOI/90aAgvVXTTU7vqJHantPNc/sWDYfh5mGXNyfiAxbtKQnM=
X-Received: by 2002:adf:fd4f:0:b0:220:60bc:3fc9 with SMTP id
 h15-20020adffd4f000000b0022060bc3fc9mr15799853wrs.398.1660100871902; Tue, 09
 Aug 2022 20:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAO4fCV6xnz7L-DeDY6ioSmc8viEyL7J9kPKzgcBgrbx+V8f7aQ@mail.gmail.com>
In-Reply-To: <CAO4fCV6xnz7L-DeDY6ioSmc8viEyL7J9kPKzgcBgrbx+V8f7aQ@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 9 Aug 2022 20:07:40 -0700
Message-ID: <CACWQX80o7KfPrZFKuQZbyZhK-m5m2w+5Xqisxout6YodUH47gg@mail.gmail.com>
Subject: Re: Regarding OpenBmc filtering option
To: "Havaligi, Mruthyunjaya Rao (Jay)" <mruthyunjaya.rao.havaligi@verizon.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 9, 2022 at 8:00 PM Havaligi, Mruthyunjaya Rao (Jay)
<mruthyunjaya.rao.havaligi@verizon.com> wrote:
>
> Hi,
>
> I am trying the filter option in openbmc (wht-0.91-0-gca8d06-ca8d06b) on =
Qemu. I am not able to filter based on the Id. I see where the filtering op=
tion was verified in this link -  https://gerrit.openbmc.org/c/openbmc/bmcw=
eb/+/43505. Also, can I use ge, le and other options too?

Based on your version number, I'm assuming you're using the Intel-BMC
fork;  I can't speak to what they have implemented, but OpenBMC today
does not have an implementation of $filter.

https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53013

Was me starting to work on it, and not getting very far.

https://gerrit.openbmc.org/c/openbmc/bmcweb/+/43505

Was another attempt that didn't go very far and was stacked behind a
large number of other patches.  If it's something you're interested
in, feel free to use either as a starting point.

>
>  curl -ku  x:x  'https:/x.x.x.x/redfish/v1/Managers/bmc/EthernetInterface=
s?$expand=3D*'
> {
>   "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces",
>   "@odata.type": "#EthernetInterfaceCollection.EthernetInterfaceCollectio=
n",
>   "Description": "Collection of EthernetInterfaces for this Manager",
>   "Members": [
>     {
>       "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth0"
>     },
>     {
>       "@odata.id": "/redfish/v1/Managers/bmc/EthernetInterfaces/eth1"
>     }
>   ],
>   "Members@odata.count": 2,
>   "Name": "Ethernet Network Interface Collection"
> }
> curl -ku xx:xx  https:/x.x.x.x/redfish/v1/Managers/bmc/EthernetInterfaces=
?$expand=3D*&$filter=3DId eq 'eth1'
> curl: (52) Empty reply from server <<<
>
>
>
> Thanks,
> Jay
>
