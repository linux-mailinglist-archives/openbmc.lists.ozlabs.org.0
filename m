Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B571C2C802C
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 09:39:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkzDx5JKQzDqw1
	for <lists+openbmc@lfdr.de>; Mon, 30 Nov 2020 19:39:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32;
 helo=mail-yb1-xb32.google.com; envelope-from=priyankapillai1206@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e1+8tZIn; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkzCn00XdzDqsl
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 19:38:44 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 10so10625982ybx.9
 for <openbmc@lists.ozlabs.org>; Mon, 30 Nov 2020 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pP9IZW0+mkSeJ29qoa2QPD+AYGM2LCk5nLzEz3dR2Io=;
 b=e1+8tZInIkvEnXJqM7AwOLA2KdRegbqIeteeqJeOmvhj0Wos81LEBAvtCZXzKmz9YS
 Nnr6SwQsrZf9E8RntJN5tYLDEf0wvvfG8zP2Co4hqBUH1dbakDwqBQkiD25gLzf/l/1P
 AQIwKLIL58XD7g2XvsYT0MJaCMymZ1lCpn5a+H0iI7nDu92nxeLZXkm3+iWabv8xIBo/
 wbf+3bSCRaVAavYoVHfMEBdtBpV5uLXJIZLA8TtqWMVALjcKaFw6tIM1eM6uqrYkSRAW
 BGy3KVXnGJl34yoURHALVIdzLNqK+lTAWrFBpjKyHVF9vu+ozsSHkkL5rGnVY7kpZGfx
 APMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pP9IZW0+mkSeJ29qoa2QPD+AYGM2LCk5nLzEz3dR2Io=;
 b=fHaNt9oIS89TDDFRGhbejlzQdE4v5GHc4+ZLkcF8pKZhY5JQ/+HmS7b1V5FkqTDWhO
 Yxf2oWR4xu8DexmTMnWOMoXEQ5diMMpPX6nuu0dvb6Y+HhMjjZErSDE6Mw7XrQnIyafg
 CtBzUkRwKIF1+b/NxZH3a2cYKOwz7d4LlFz1aO8H6QlJSWcbz3WPvvE0++1I/0+jKCZf
 HeG+5P/0UhMM7KahMkHJA/+TlDYdbzpFMygPp5WXTi2mhSn3jqYEYzGyMA2TFAR/fnsZ
 ohnjmRExjkM93PRJAUC2Q5i02vi8JZo4T7629lt6kdLGRPB6xBurNO9BJdElO35V4io8
 5ZUA==
X-Gm-Message-State: AOAM531O/AZTG5lPPpz+EYg89+YV46C/2k6rHJbEMG8j8hlkV6ZYgQnT
 76HB3ti3dPk12ero0607PYpMoEGsexqFtxXN1sWKUR57
X-Google-Smtp-Source: ABdhPJwtekGGTfNTks2xrTYVxo/66aVYJjJBhabKSQo1vVANCoJVJDCX+Sk8/XV2zedo3u+xyEicb2jO5sT7C5HBzRs=
X-Received: by 2002:a25:3281:: with SMTP id
 y123mr34271789yby.467.1606725519848; 
 Mon, 30 Nov 2020 00:38:39 -0800 (PST)
MIME-Version: 1.0
From: Priyanka Pillai <priyankapillai1206@gmail.com>
Date: Mon, 30 Nov 2020 14:08:28 +0530
Message-ID: <CAJCnuYmUnv_qM=AQ+cPURiuxLzQLQHeG4wL99wBERYKknKSS=A@mail.gmail.com>
Subject: Requesting feedback on in-progress GUI designs - Security Settings
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000dcb9b005b54eefd8"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000dcb9b005b54eefd8
Content-Type: text/plain; charset="UTF-8"

Hello,

Requesting feedback on the current iteration(4) of Security Settings
screens in the WebUI:
https://github.com/openbmc/webui-vue/issues/5

Thanks in advance!

Warm regards,
*Priyanka Pillai*
User Experience Designer
IBM iX : Interactive Experience

--000000000000dcb9b005b54eefd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Requ=
esting feedback on the current iteration(4) of Security Settings screens in=
 the WebUI:</div><div><a href=3D"https://github.com/openbmc/webui-vue/issue=
s/5" target=3D"_blank">https://github.com/openbmc/webui-vue/issues/5<br><br=
></a><div>Thanks in advance!<br><br><font size=3D"2" face=3D"Georgia">Warm =
regards,</font><br>
<b><font size=3D"3" face=3D"Georgia">Priyanka Pillai</font></b><br>
<font size=3D"1" face=3D"Arial" color=3D"#696969">User Experience Designer<=
br>
IBM iX : Interactive Experience</font></div></div></div></div>

--000000000000dcb9b005b54eefd8--
