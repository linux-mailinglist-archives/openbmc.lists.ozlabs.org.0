Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D616196FA
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 05:13:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450ZzT1lFtzDqCV
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2019 13:13:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjPvLnJC"; 
 dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450Zxz0ZWTzDqRR
 for <openbmc@lists.ozlabs.org>; Fri, 10 May 2019 13:12:06 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id h4so5762587wre.7
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PdPu5Pu4nZvsXgOdNkRIqA+KuLcuflNXdjoMPRNHZ5o=;
 b=cjPvLnJCaKUS9kuiDGY9CjpC4X1pUIE9Z7UUQp0UWLjiVKb0Hou/ffJ0sMDcL3Uaum
 KXRqqPX6ZQGd1yYOIScTKCmNNB+fQn+c31l/Vf5j/QeXK0ahhMZySlzxiqzqPnHAVpGW
 5Uj9I5yZSu4zY12LpDU7woV+/CIA1wB+bUHcpz1yczgwL9CtjIgicZ3Y2WTj3kuJyr0W
 qd2nfhsZ2jYqqWcvul/wxx53baJTi4jyM8YT7kUuWmpMMSJPQ5oZQHTCysIFV8iAlHdC
 MMyvOIsjqoL334EpZLncisEN74wchl96iqdeHnx5dEotrk+ItVol22pSWwKMyKTyVJJX
 b1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PdPu5Pu4nZvsXgOdNkRIqA+KuLcuflNXdjoMPRNHZ5o=;
 b=ekQxqgs/XAYYIArpVXgI2zIKEBifjoA8GbiZbFP0YouYcjjpYgSGEOik7NN3dl6O6i
 81ShqnuTr7DTG5q/oBABFnxEG1mAONzWfVga/Kd49Aieh4ShYrcXgXHE5olUJUveeTQD
 mF+y8qttI8HEa5kYBL+mxqS40p9Izk5QcsM0jNjDQRpwH0bB3xeGBZxXJX8IcrM6LZZG
 nID58luUdv58cGpfkHXrEX3VK1lzV2vFB4EnZqBzh5tVU4FpIqNdOaxbd2u4P5kgtHq0
 xNUSvvwrzsZexZhBBz5E4ytOCKlORo4afskRwofH5dalyUT/zfnnRFRTAbpP3vzBqh28
 ChdQ==
X-Gm-Message-State: APjAAAVvQN3VaHXwUzBSm8qnCAJpEzz2V/PGrcgPYtavH39scLW75O11
 FlRmmvN413XnHppMaT8zPM0Ie4HoffHXlvgH2IhWK3Cy
X-Google-Smtp-Source: APXvYqzagIxGXfh9GHwR95JlCekyor04lgwU2z3ddrNpAhFeOnRWCowF+GiYUr32nx1k90KXH2xlGnDzeIelEOUsksM=
X-Received: by 2002:a5d:518d:: with SMTP id k13mr4152664wrv.285.1557457920527; 
 Thu, 09 May 2019 20:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
 <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
 <006052f8-dce3-d523-6d7e-8bb610648deb@intel.com>
 <CANT4NrKDC92KOmUcsdP6hWarJKuRP7VTZSwD-F32g+Loqe4VEA@mail.gmail.com>
 <865C376D1B77624AAA570EFEF73CE52F94537DF0@fmsmsx118.amr.corp.intel.com>
In-Reply-To: <865C376D1B77624AAA570EFEF73CE52F94537DF0@fmsmsx118.amr.corp.intel.com>
From: Derick <derick.montague@gmail.com>
Date: Thu, 9 May 2019 22:11:49 -0500
Message-ID: <CAOUmYFTYtxQBJk7iRAVJ7YUgH2-z_t=i9R1opwifJ72M97XaFA@mail.gmail.com>
Subject: Re: OpenBMC GUI navigation -- User vs Security
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I agree.  I would add that =E2=80=9CAccess Control=E2=80=9D is a generic =
term (as opposed to =E2=80=9CUser Management=E2=80=9D). This means some oth=
er items may potentially fall into this category.

This is the last email I could find on this thread. I would like to
verify we have reached consensus as we are approaching the time to
update the navigational structure from "Users" to "Access Control".
Once the "LDAP Settings" and "Certificate Management" work is
completed, we will be ready for the change.

Current Navigation Structure
- Users
  - Manage User Account

Proposed Navigation Structure
- Access Control
  - Certificate Management
  - LDAP User Management
  - Local User Management
