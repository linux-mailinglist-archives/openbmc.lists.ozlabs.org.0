Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12892CF99D
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 14:18:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nbwg6rWTzDqPk
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 23:18:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QLjGKJxz"; 
 dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nbvX3yMFzDqMw
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 23:17:28 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 60so13840653otu.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Oct 2019 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lpnYElBeFtrTpEUolK/uxHCS7757hYl8Yq71/y3sAkg=;
 b=QLjGKJxzJf4G5XfnFK03UaFl4nNa9YO0R5gsxFDLwsq31AK/6oOJ0HNSQppdhAd6Iq
 vdFG4VBcDd54OXuLa5O8TAjIPHoVHQpCaScsADtpP4Iwzi9SnbyZPnYdcmz2JnkZbo/R
 QQYJfb4TgdSPq3ysdBppzv5QJe0VHkRUoOM2aVTehvUHNT/00rlGQpDcRy5rv5jjq6z6
 Y3tHNlEM+W9KluYRxXylXlBHl95JS5+eRLXsWSvH4VVa6WhuLqaxY5fQHBSMm9ybhGar
 Hf78PS23UuiaxAWGzHLkrvcMyVNp/SQUCnvXiWcC8FtL8Wn2Kkzd7bTmjl9onaesIBPp
 8MHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lpnYElBeFtrTpEUolK/uxHCS7757hYl8Yq71/y3sAkg=;
 b=MOwAccQ86ef0T+PAfU20bKIRaS05tx/Q0E9vZyIY1ecJ2+P3wnpRDPVecB3rItF8bi
 E+snhd+DBgWtNsbvq0/ZVuB9Ifr3Dq4q+w3rB3Ie4PA7BNOO+VYFERCvsbwESGAr9mYf
 7kJ8LBSz67Vh9fUW3lpxhYOeCjRKaZEroiTAwel3LAOJMmlTM2bZ4LMcyzD7+R066r5R
 gmXGe4Huh36/usir+gUSPvikjIIQLL7xzMlLbOI4Y0ZLAyi5z59xrYLT35QGJJUkiLuZ
 WBGvUNhiKoRmCrgJt2zoavDx48ufZXSegczw1HLB9gCCiqJ6MWK92Wpj2O04k22I4q66
 +4vg==
X-Gm-Message-State: APjAAAVp4bVB71wtjCJdmib/Ei4qyQ5zz9c2hukjhmBYPdgh7nhydXnv
 2MFfJcWWtS9ofywJXJTGiif0V+R8a0I0RfcYw6ckPRkPnmY=
X-Google-Smtp-Source: APXvYqyH+ByMKuDp5WlQE4jVYxkHfJBArMmX5805oBrHpsJMpRL8YmRk3oZ9yBzy5ZeoEsgPQ5mYsuFyx8SYbbOl4rA=
X-Received: by 2002:a05:6830:92:: with SMTP id
 a18mr12369405oto.263.1570537045264; 
 Tue, 08 Oct 2019 05:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <daa541bc6f9344d69f2590b64c875a46@inspur.com>
In-Reply-To: <daa541bc6f9344d69f2590b64c875a46@inspur.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 8 Oct 2019 07:17:09 -0500
Message-ID: <CALLMt=qwfOhcFV9-bKSzBgPk4H41nw_tsjqJYVPsy8Q8d3u8dA@mail.gmail.com>
Subject: Re: Upload firmware through TFTP on REDFISH interface.
To: =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>
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

On Mon, Oct 7, 2019 at 10:30 PM Xiaochao Ma (=E9=A9=AC=E5=B0=8F=E8=B6=85) <=
maxiaochao@inspur.com> wrote:
>
> Hi, all.
>
> I'm trying to update firmware using REDFISH interface.
> It can successfully upload images through TFTP on the BMCweb.
> However, the firmware upgrade command in
> https://github.com/openbmc/docs/blob/master/REDFISH-cheatsheet.md
> failed.(Through TFTP method)
> The TFTP command here is not configured.
> The results of the command are as follows:
>
> $ curl -k -H "X-Auth-Token: $token" -X POST https://${bmc}/redfish/v1/Upd=
ateService/Actions/UpdateService.SimpleUpdate -d '{"TransferProtocol":"TFTP=
","ImageURI":"obmc-phosphor-image-fp5280g2-20190924042243.static.mtd.tar"}'

First make sure you have TFTP update enabled in bmcweb:
(BMCWEB_INSECURE_ENABLE_REDFISH_FW_TFTP_UPDATE)
https://github.com/openbmc/bmcweb/blob/master/CMakeLists.txt#L57

Then you need to be sure to provide the IP address of the TFTP server
in your URI
-d '{"TransferProtocol":"TFTP","ImageURI":"<ip address of TFTP
server>/obmc-phosphor-image-fp5280g2-20190924042243.static.mtd.tar"}'


>
> How should the address of TFTP be configured?
>
