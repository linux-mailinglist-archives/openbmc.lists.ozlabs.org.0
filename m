Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA63D232C
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 14:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVrvX5JGXz30GW
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 22:13:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ThhtbQuM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=tyler.sabdon@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ThhtbQuM; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVrvG45cHz2ydk
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 22:13:13 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 x13-20020a17090a46cdb0290175cf22899cso5209624pjg.2
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=Hh/Kxi0YFVSp4hkqTwPgNOMnEcQ976pyX1uEiOwqoAU=;
 b=ThhtbQuMyo6QeoUaMsmBFdvj8q+oobJTqLbJlyT8x/VpfmMOAgYOSv4kZHlsAj491E
 7gKGutjTC6qdMUInauzRmm/yAQi2DlubB96eYdBD9DmflNjg2kFDexR+dbHcYH2Guv6R
 37dmsP9fdQzyqheAlyy1f4cEI0I4bX9fk54L1mBHYDIwJrxl/sa6yub5Day5MQDskwqi
 RHVO/rtvSzpBELgvS4xY91wqEGDNjMtx/AArMSPLVnhpm5n0ND3PYjHvBo79ilLY8v4I
 DCSh/ajWWDVLk26LLIkirvDEgStg2g+XF7xbhAMeGZDWeNjesOGkx59arxqObmt46WeG
 lfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=Hh/Kxi0YFVSp4hkqTwPgNOMnEcQ976pyX1uEiOwqoAU=;
 b=dmnpBxpPuditI6mWeu3l6zv2EBI4y4EUZjlFAm4LMLLrpLQnM21zYUbneWyj5WafJh
 3gJwLjmhPz8Ev+DC+pIZmCLptAZzC+tsdGbJ8xncyXLm7/D2s0E+vrbA1M7OV0K7FI2E
 VD3VeGgofF1a7lkk/82P4eUgBxT0MUOhobjkCjPxDab6WEAxs+pEDrq6NvD4TLK5sFFJ
 IHIhNTBXp8Bd8SJmuvEMQeEQLxaRyRKp/p90Me76XTM7DwbQFRHH39alleolByQchMg+
 a79N9Qq9trhlk/Etx+MABX4wkdGQU1C4gna5b4X3esmJ8/5zd24gRhpqqvpPbI4BPlOY
 stuw==
X-Gm-Message-State: AOAM533KYoZE8sXnJ8uzEHb+KPRaJiKblzrnl4x5H5YHrssFcfPYN16K
 SDa8VY9bF28mLffl7jyA6hsfFjoadcTt8Q==
X-Google-Smtp-Source: ABdhPJxgRb2K0z7bviL9s6+xlwfsSu5CEtcsuzJLSJ2S6DuGAdKwS4h8jILIV0GEbIyL4VXIcMcwew==
X-Received: by 2002:a17:902:e052:b029:12b:491f:4eb6 with SMTP id
 x18-20020a170902e052b029012b491f4eb6mr31689000plx.81.1626955986047; 
 Thu, 22 Jul 2021 05:13:06 -0700 (PDT)
Received: from [192.168.0.6] (1-160-4-131.dynamic-ip.hinet.net. [1.160.4.131])
 by smtp.gmail.com with ESMTPSA id
 u24sm31352325pfm.200.2021.07.22.05.13.05
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 05:13:05 -0700 (PDT)
From: Deng Tyler <tyler.sabdon@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: bus method call error process
Message-Id: <1710A383-17B7-4B49-9468-A78B1A3D9C9A@gmail.com>
Date: Thu, 22 Jul 2021 20:13:02 +0800
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
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

Hi all:
    I create my bus service and try to use bus method call to get some =
property from other bus service. But I encounter a bus call issue that =
my service suspended if I try to make a method call with a non active =
service. For example:
=E2=80=A6
method =3D bus.new_method_call(=E2=80=9Cnon-active service=E2=80=9D, =
obj, interface, method);
reply =3D bus.call(method);
#service suspended here=E2=80=A6
if(reply)=E2=80=A6.
=E2=80=A6

Could someone help to give a hint??
Thanks.


