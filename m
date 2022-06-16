Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE6054D8AA
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmyZ55CTz3f3S
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rwwBIxKw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=jebr@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rwwBIxKw;
	dkim-atps=neutral
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNmy92d4Kz2x9J
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 12:55:44 +1000 (AEST)
Received: by mail-io1-xd2e.google.com with SMTP id r5so243293iod.5
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 19:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SI2Xegn36xgnC9xUhHxe7pX9UCkDfdg583V08aY4yfM=;
        b=rwwBIxKw+XhvtM6lNAb+ErdWfvphguKEcMpXOfMLNXAsWSGEV1mHMM6PLFjXM/r9N8
         lxTzOMLhMZDAnc97NLSDls8+nsSi385yIqNJLLe7nEgL/hkzvqBYXl25vtcBllp5PVf2
         daRKacHveADrOrT9OR9kp3QKKdE5ZEaHz+x3+GyyPHzDISXaHQg3EoHlVtJd1K8uIQuH
         1104SZNT50DiETQ4/Mv67cEzaD5B+HX4s32R2kACqdSGCDcUE+Lq+VyvVXw4Y02/rCCk
         lWKJl2Yoky6X7F24kEs+8XycGEbQsqjmutKI6OoWGwFubqVpT0xGKROJHIEeQE8i1UvE
         IRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SI2Xegn36xgnC9xUhHxe7pX9UCkDfdg583V08aY4yfM=;
        b=Ms1yLoozPHV7cMXMF0cvdqN58S9knRtso6xat2CVIgto8Bm/uNueHoyq90joTnEzGr
         6ic6EHXy7ZVzHJYJSvzYoLh1vgdyJarVZ1FUioYiUwGLoS3P7GSoLyV53gXWs5mzfIYz
         VDp70PZE6Gv9+UiPj8OKTf23XUW1XV9xwOxBi87N/1fCpTHLJmUVsOjp9Feqsp/VQDnb
         +PlwCUmdzPZGzB0gDxVL6bCuUmJIdlmw2NDHW/es6m3B3//QhQtOBTe/6yKm7TRoSrvh
         yGBNy5Y7piZA9uzzkb22OkvS8Tp02ovNOXnZ1/mUn1Em7dnAR5gX0rdHkXoJjY4DW75n
         p9kA==
X-Gm-Message-State: AJIora9GLir48Je2nTBkCjTjM6Wu5tptRy/d5/1ea7FR6g1Hpv5uJNQC
	luC5A8s+qRQzExWdjxEPeuh2XjBDp0pNKjcCWCkuUUdgJ5P0OA==
X-Google-Smtp-Source: AGRyM1uWM0ZJzMBOh4nFCW9CqXbhUGeH8sURwBNXgKmD4NGvd5+ICTgOad+QimTKoOhjigmfMPuUqLmhrcdIQajKACc=
X-Received: by 2002:a05:6638:40ab:b0:331:a983:4f75 with SMTP id
 m43-20020a05663840ab00b00331a9834f75mr1561204jam.107.1655348141164; Wed, 15
 Jun 2022 19:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <67926d72c3633b9524370b8dfe89f4bfed3fac89.camel@fuzziesquirrel.com>
 <AFoAOgA1IrcibjulenUAq4q5.3.1654744270317.Hmail.xzcheng@kunluntech.com.cn>
In-Reply-To: <AFoAOgA1IrcibjulenUAq4q5.3.1654744270317.Hmail.xzcheng@kunluntech.com.cn>
From: John Broadbent <jebr@google.com>
Date: Wed, 15 Jun 2022 19:55:30 -0700
Message-ID: <CAPw1Ef_VJv1ZmgKf4XYt5oeOVXi084yPV9dimH-aozdDDZMzZg@mail.gmail.com>
Subject: Re: How to post patches for review to Gerrit?
To: =?UTF-8?B?5oiQ5L+u5rK7?= <xzcheng@kunluntech.com.cn>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Can you try:
  $ git push origin HEAD:refs/for/master

if that does not work try something like this:
   $ git push ssh://xiuzhi11@gerrit.openbmc.org:29418/openbmc/kunlun-ipmi-o=
em
HEAD:refs/for/master -vvv

There are instructions here with a sample push command
https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md#pus=
h-code-change-to-gerrit

Let us know if you have any issues.


On Wed, Jun 15, 2022 at 7:05 PM =E6=88=90=E4=BF=AE=E6=B2=BB <xzcheng@kunlun=
tech.com.cn> wrote:
>
> Hi ,
>   I want to post a patch to openbmc/kunlun-ipmi-oem gerrit server for rev=
iew,
>  https://gerrit.openbmc.org/admin/repos/openbmc/kunlun-ipmi-oem,general
>
> I cloned it by :
>    git clone "ssh://xiuzhi11@gerrit.openbmc.org:29418/openbmc/kunlun-ipmi=
-oem"
> the command :git remote -v is:
> origin ssh://xiuzhi11@gerrit.openbmc.org:29418/openbmc/kunlun-ipmi-oem (f=
etch)
> origin ssh://xiuzhi11@gerrit.openbmc.org:29418/openbmc/kunlun-ipmi-oem (p=
ush)
> I cannot not find the new patch on gerrit when I use command:
>     git push origin main
> it merged to the repo https://github.com/openbmc/kunlun-ipmi-oem directly=
.
> why?
> Xiuzhi
>
> ---------------------------------------------------
>
> --
> Xiuzhi Cheng
> BMC Firmware Team
> Kunlun Technology (Beijing) Co. Ltd.
> Taiji building, No.211, Beisihuan Middle Road, Haidian District, Beijing,=
China.
> TEL: 8610-89056290
> www.zd-tech.com.cn
>
>
