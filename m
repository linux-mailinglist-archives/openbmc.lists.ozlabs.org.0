Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 618A775A732
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 09:05:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VtWFtJG0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R63c72DkLz3bwR
	for <lists+openbmc@lfdr.de>; Thu, 20 Jul 2023 17:05:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VtWFtJG0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=chandutmba@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R63bV07ZRz2yV5
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 17:04:53 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-53fa455cd94so211522a12.2
        for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2023 00:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689836687; x=1690441487;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kyFkHfOCgftW6Fyph6B/Qfk1+pDH+HvX5etEKHCq7QI=;
        b=VtWFtJG09+SroWYhgHvpq2/ZW9AYuczDEvN6JVHTVMzM7I+hIXyT1uoexvMmIy3h4N
         xsKIVLF1o3XdDxRUjom0iBvCwIPUWgaWDCczyhtXj5DHfM7XnNyy/bSZ1bZkUA9sZJfU
         hxi+KetxtY8aRDhnbbYkpU6cAUAekeQIXmaWUX8ctu1zkPPOd/1t86w/RlBqON0xQC2v
         /3xwmcCkSwF8z+p+4jjdNVhyd+S4iHwRoUFdxPg06R+MRDCMIWa7WjUtoOnhdCOEiUn0
         UtFLwlN0l0twzIDzU+9JKxk9BsndH7/cqy1DIct2Y23C327FW8JRA2He2e7+8o4CUh0s
         cJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836687; x=1690441487;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyFkHfOCgftW6Fyph6B/Qfk1+pDH+HvX5etEKHCq7QI=;
        b=EyUIFVwntZvgaG6itfODQZWMbeXySs0uPRUj93QHxE1chJsk8B6TD2txRwwdCWEI/P
         y3KCfnKTHSI8j5F79tCRw8qUi7gHUpI71xf4AGEo0mYXpIDP70ObW7oKlH/BMZLBbyxV
         cRp51T05Arf2Jq5Spx1wninl5sugA2FV4E44XP3FL5K3W+oHvNI5uRp/a4372gzJhCar
         jxOJEzaMHMVnPMlzigPtmWqWHnwHsmR0xLV3AFhARl5WoYF3WyvCpeSpaRy0sSCwOol5
         7C5+YrHGLZmwB1BeGRsLFmhRl+pNpejNCeH4//+7dVKWBZnyafmEsplJshMdlSkzj575
         ddLg==
X-Gm-Message-State: ABy/qLa96GEXICPwo3sTGOLtmk2OWrS+J1nP0QvUKk3JNkeY8mVeVuLI
	EV3cOOepkRF1duSPw3hFjYIlKr7pJslvHdOog8jch0tsH5E=
X-Google-Smtp-Source: APBJJlFdRf5SGoodDbO83T12cYkYdmPhr5w/zw9/1caJQnfZKou+XWQ28l502lV/APz5r2bD3nwf+lgEFIYucQkAq3o=
X-Received: by 2002:a17:90a:6c01:b0:262:e439:5013 with SMTP id
 x1-20020a17090a6c0100b00262e4395013mr16727841pjj.9.1689836687499; Thu, 20 Jul
 2023 00:04:47 -0700 (PDT)
MIME-Version: 1.0
From: chandu chanti <chandutmba@gmail.com>
Date: Thu, 20 Jul 2023 12:34:36 +0530
Message-ID: <CAPY-kLVD7ONa6fkSrQ5sfAxK4UcGZSyHoMr6sb6oQPTafMT_fw@mail.gmail.com>
Subject: Error handling
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000007ca6380600e5c3c8"
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

--0000000000007ca6380600e5c3c8
Content-Type: text/plain; charset="UTF-8"

Hi Team,

We are planning to handle errors from backend services in bmc web. We are
considering the following approaches to implement it, but we are facing
some issues. please provide your inputs.

1 . Using exceptions in our backend D-Bus service by throwing exceptions in
the D-Bus property get handlers. It works fine for the Get property method
call. However, when using the Get All method call, if one property fails,
an error is returned without checking the other properties. Is there a way
to implement exceptions in GetAll so that even if one property fails, we
can still fetch the remaining properties.

2. Using default values in D-Bus properties to indicate errors. Is there a
reference implementation available for setting default values for string
and integer data types in bmc web, similar to the implementation of NaN
(default value) for the double data type in cable.hpp.

3. Implement associated return code per property on dbus, but this would be
very inefficient in terms of double the properties on dbus, something we
would like to avoid

Thanks
Chandrasekhar T.

--0000000000007ca6380600e5c3c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p style=3D"margin-bottom:12pt;margin-right:0in;margin-lef=
t:0in;font-size:11pt;font-family:Calibri,sans-serif">Hi Team,</p>

<p style=3D"margin-left:0.5in;margin-right:0in;font-size:11pt;font-family:C=
alibri,sans-serif">We are planning to handle errors from backend
services in bmc web. We are considering the following approaches to impleme=
nt it,
but we are facing some issues. please provide your inputs.<br>
<br>
1 .=C2=A0Using exceptions in our backend D-Bus service by throwing exceptio=
ns in
the D-Bus property get handlers. It works fine for the Get property method
call. However, when using the Get All method call, if one property fails, a=
n
error is returned without checking the other properties. Is there a way to
implement exceptions in GetAll so that even if one property fails, we can s=
till
fetch the remaining properties.</p>

<p style=3D"margin-left:0.5in;margin-right:0in;font-size:11pt;font-family:C=
alibri,sans-serif">2. Using default values in D-Bus properties to
indicate errors. Is there a reference implementation available for setting
default values for string and integer data types in bmc web, similar to the
implementation of NaN (default value) for the double data type in cable.hpp=
.=C2=A0</p>

<p style=3D"margin-left:0.5in;margin-right:0in;font-size:11pt;font-family:C=
alibri,sans-serif">3. Implement associated return code per property on
dbus, but this would be very inefficient in terms of double the properties =
on
dbus, something we would like to avoid</p>

<p style=3D"margin-bottom:12pt;margin-right:0in;margin-left:0in;font-size:1=
1pt;font-family:Calibri,sans-serif">Thanks <br>
Chandrasekhar T.</p></div>

--0000000000007ca6380600e5c3c8--
